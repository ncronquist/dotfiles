# Reddit thread - t.ly/s6B9

if grep -qi "microsoft" /proc/version &>/dev/null; then
    export wslip=$(ip addr sh $(ip route list default | grep -Po ' dev \K\w+') | grep -Po ' inet \K[\d.]+')
fi
