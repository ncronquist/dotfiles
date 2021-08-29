#!/usr/bin/env bash

# While I would normally set the following bash flags, since this script is
# sourced into my shell, it can cause issues for other scripts
# set -o errexit   # Same as set -e; Exit immediately if a pipeline (…) returns a
#                  # non-zero status.
# set -o pipefail  # Only return 0 if all parts of the pipeline return 0
# set -o noclobber # Prevents you from accidentally overwritting a file with >
#                  # when you meant to use >> Can be overridden with >!
# set -o nounset   # Same as set -u; Exit if script tries to use undeclared var

declare -ax __AMA_REQUIRED_UTILITIES=("aws" "sed" "awk")

function __ama_usage() {
  echo "
usage: ama <command> [OPTIONS]

mfa-session, mfa   Retrieves an aws sts session-token and sets the
                   relevant AWS environment variables in the
                   shell

                   [OPTIONS]
                   -p, --profile  AWS configuration profile to use; Defaults to
                                  default; Can also be set with AWS_PROFILE
                                  environment variable
                   -t, --token    AWS MFA token (optional; will prompt if
                                  missing)

                   Example usage:
                   $ ama mfa-session --profile long-term --token 123456
                   $ ama mfa-session -p long-term -t 123456
                   $ ama mfa

clear-envs, ce     Clear AWS environment variables from current shell

                   Example usage:
                   $ bcs clear-envs
                   $ bcs ce

profile, p         Sets the current AWS_PROFILE environment variable
                   This may be useful when you have credentials set in the
                   AWS credentials file, and just need to reference them.

                   Example usage:
                   $ aws profile sandbox
                   $ aws p sandbox"
}

################################################################################
# Checks if a shell command exists
# Returns 1 if if the command doesn't exist, 0 if it does
# Globals
#   None
# Arguments
#   command_name
# Returns
#   None
################################################################################
function __command_exists() {
  command -v "$@" >/dev/null 2>&1
}

################################################################################
# Ensures all required utilities are available
# Returns 1 if any required utility doesn't exist, 0 they all do
# Globals
#   __AMA_REQUIRED_UTILITIES
# Arguments
#   None
# Returns
#   None
################################################################################
function __check_shell_requirements() {
  local missing=0
  for req in "${__AMA_REQUIRED_UTILITIES[@]}"; do
    if ! __command_exists "$req"
    then
      echo "Missing required utility: $req"
      missing=1
    fi
  done
  return "${missing}"
}

################################################################################
# Returns the mfa_token if given, otherwise prompts for value and then returns
# that value
# Globals
#   None
# Arguments
#   mfa_token - optional; will prompt if missing
# Returns
#   mfa_token
################################################################################
function __get_mfa_token() {
  if [ -z "$1" ]; then
    bash -ci 'read -r -p "MFA Token: " mfa_token && echo $mfa_token'
  else
    echo "$1"
  fi
}

################################################################################
# Retrieves AWS MFA credentials with session token and sets those values as AWS
# environment variables in the shell
# Globals
#   AWS_PROFILE - optional; defaults to default or can be overridden with
#                 profile option
# Arguments
#   -p, --profile  AWS configuration profile to use; Defaults to
#                  default; Can also be set with AWS_PROFILE
#                  environment variable
#   -t, --token    AWS MFA token (optional; will prompt if
#                  missing)
# Returns
#   None
# Sets
#   AWS_ACCESS_KEY_ID
#   AWS_SECRET_ACCESS_KEY
#   AWS_SESSION_TOKEN
################################################################################
function __mfa_session() {
  # Using enhanced `getopt` from util-linux to parse options
  # https://stackoverflow.com/a/29754866
  readonly OPTIONS=t:p:
  readonly LONGOPTS=token:,profile:

  local t=""
  # If the user has the AWS_PROFILE environment variable set, then use that and
  # allow override with the profile flag below; Otherwise default to default
  local p=${AWS_PROFILE:-default}

  # Temporarily store output to be able to check for errors
  # Activate quoting/enhanced mode (e.g. by writing out “--options”)
  # Pass arguments only via   -- "$@"   to separate them correctly
  local parsed
  if ! parsed=$(getopt --options="${OPTIONS}" --longoptions="${LONGOPTS}" --name "$0" -- "$@")
  then
    # If parsing fails, then exit early
    return 1
  fi

  # $parsed will be something like "-t '123455' -p 'long-term' --"
  # Use the set function to reset the $1, $2, $n variables
  eval set -- "${parsed}"

  # now enjoy the options in order and nicely split until we see --
  while true; do
    case "$1" in
      -t|--token)
        t="${2}"
        shift 2
        ;;
      -p|--profile)
        p="${2}"
        shift 2
        ;;
      --)
        shift
        break
        ;;
      *)
        echo "Programming error"
        break
        ;;
    esac
  done

  local mfa_token
  mfa_token=$(__get_mfa_token "$t")

  local aws_profile="${p}"

  local mfa_arn
  mfa_arn=$(aws --profile "${aws_profile}" iam get-user \
    --query 'User.Arn' \
    --output text | sed -e "s/user/mfa/")

  read -r AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN <<< \
    "$(aws --profile "${aws_profile}" sts get-session-token \
      --duration 129600  \
      --serial-number "${mfa_arn}" \
      --token-code "${mfa_token}" \
      --output text  | awk '{ print $2, $4, $5 }')"

  export AWS_ACCESS_KEY_ID
  export AWS_SECRET_ACCESS_KEY
  export AWS_SESSION_TOKEN
}

################################################################################
# Sets AWS_PROFILE enviornment variable in the shell
# Globals
#   None
# Arguments
#   None
# Returns
#   None
################################################################################
function __set_profile() {
  local profile="${1}"

  # Clear other AWS environment variables to avoid issues
  __clear_envs

  export AWS_PROFILE="${profile}"
}

################################################################################
# Unsets AWS MFA credentials from shell
# Globals
#   None
# Arguments
#   None
# Returns
#   None
################################################################################
function __clear_envs() {
  unset AWS_ACCESS_KEY_ID
  unset AWS_SECRET_ACCESS_KEY
  unset AWS_SESSION_TOKEN
  unset AWS_CREDENTIAL_EXPIRATION
  unset SAML2AWS_PROFILE
  unset AWS_SECURITY_TOKEN
  unset AWS_REGION
  unset AWS_PROFILE
}

################################################################################
# Entry Function
################################################################################
function ama() {
  local command="$1"
  case $command in
    "" | "-h" | "--help")
      __ama_usage
      ;;
    "mfa-session" | "mfa")
      __check_shell_requirements || return
      shift 1
      __mfa_session "$@"
      ;;
    "clear-envs" | "ce")
      __clear_envs
      ;;
    "profile" | "p")
      shift 1
      __set_profile "$@"
      ;;
    *)
      __ama_usage
      ;;
  esac
}
