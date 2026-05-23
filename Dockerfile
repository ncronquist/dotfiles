FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt -y upgrade \
  && apt install -y --no-install-recommends \
    apt-transport-https \
    autoconf \
    automake \
    bison \
    bc \
    build-essential \
    bzip2 \
    ca-certificates \
    caca-utils \
    calibre \
    coreutils \
    curl \
    dirmngr \
    djvulibre-bin \
    dnsutils \
    ffmpegthumbnailer \
    file \
    findutils \
    fontforge \
    gcc \
    git \
    gnupg \
    gnupg2 \
    gpg \
    grep \
    gzip \
    highlight \
    hostname \
    imagemagick-6.q16 \
    indent \
    iptables \
    jq \
    less \
    libc6-dev \
    libevent-dev \
    libffi-dev \
    libimage-exiftool-perl \
    libncurses5-dev \
    libreadline-dev \
    libssl-dev \
    libtool \
    libyaml-dev \
    libxslt-dev \
    locales \
    lsof \
    make \
    mount \
    net-tools \
    odt2txt \
    p7zip-full \
    pkg-config \
    poppler-utils \
    python-chardet \
    python3-pip \
    python3-venv \
    ranger \
    rcm \
    silversearcher-ag \
    ssh \
    strace \
    sudo \
    tar \
    transmission-cli \
    tree \
    tzdata \
    unixodbc-dev \
    unzip \
    w3m \
    xclip \
    xz-utils \
    zip \
    zsh

RUN chsh -s /bin/zsh || true

COPY . /root/.dotfiles

RUN /root/.dotfiles/install/ubuntu asdf \
  && /root/.dotfiles/install/ubuntu pipx \
  && /root/.dotfiles/install/ubuntu fzf

RUN echo '\nsource $HOME/.asdf/asdf.sh' >> /root/.bashrc


ENV PATH=${PATH}:/root/.asdf/bin:/root/.asdf/shims

RUN asdf plugin add neovim \
  && asdf install neovim 0.5.1 \
  && asdf global neovim 0.5.1 \
  && apt install -y python3-neovim

RUN asdf plugin add tmux \
  && asdf install tmux 3.2a \
  && asdf global tmux 3.2a

RUN asdf plugin add golang \
  && asdf install golang 1.17.1 \
  && asdf global golang 1.17.1

RUN asdf plugin add direnv \
  && asdf install direnv 2.28.0 \
  && asdf global direnv 2.28.0

RUN asdf plugin add dotnet-core \
  && asdf install dotnet-core 5.0.401 \
  && asdf global dotnet-core 5.0.401

WORKDIR /root/.dotfiles

ENV TMUX_PLUGIN_MANAGER_PATH=/root/.tmux/plugins/

RUN rcup -v || true
RUN rcup -v || true
RUN /root/.tmux/plugins/tpm/bin/install_plugins

RUN fc-cache -f -v

ENV SHELL /bin/zsh

WORKDIR /root

ENTRYPOINT ["/bin/zsh"]
