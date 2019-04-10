export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export RUSTHOME=$HOME/.cargo

if [[ $PATH_AT_LOGIN == "" ]]; then
    export PATH_AT_LOGIN=$PATH
fi

export PATH=$PATH_AT_LOGIN:$HOME/bin:$HOME/.local/bin:$GOBIN:$RUSTHOME/bin
export NIX_PATH=
export GO111MODULE=on
