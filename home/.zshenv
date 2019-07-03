export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export RUSTHOME=$HOME/.cargo

if [[ $PATH_AT_LOGIN == "" ]]; then
    export PATH_AT_LOGIN=$PATH
fi

export PATH=$HOME/bin:$HOME/.local/bin:$PATH_AT_LOGIN:$GOBIN:$RUSTHOME/bin:/usr/bin/vendor_perl
export NIX_PATH=
export GO111MODULE=on
