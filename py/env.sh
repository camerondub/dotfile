alias py='python3'
alias ipy='ipython3'
alias pyon='source .pyenv/bin/activate'
alias pyoff='deactivate'

__check_activate_python_venv() {
    if [ -d "./.pyenv" ]; then
        if [[ -z $VIRTUAL_ENV ]]; then
            pyon
        elif [[ $VIRTUAL_ENV != $PWD/.pyenv ]]; then
            pyoff
            pyon
        fi
    fi
}

__check_deactivate_python_venv() {
    if [[ ! -z $VIRTUAL_ENV ]]; then
        pyoff
    fi
}

# aliases for testing local code modifications
__python_local_invoke() {
    __check_activate_python_venv
    if [[ $# -eq 1 ]] ; then
        local pkg=${PWD##*/}
    else
        local pkg=$2
    fi

    pip install -e .

    local cmd=$1
    echo
    echo $cmd $pkg
    shift
    shift
    $cmd -m $pkg $@
}

pybs() {
    __check_deactivate_python_venv
    py -m virtualenv .pyenv
    if [[ $? != 0 ]] ; then
        echo "Error setting up virtualenv: $?"
        return $?
    fi
    pyon
    if [[ ! -f "pyproject.toml" ]] ; then
        cp ~/.config/cw/dotfile/py/pyproject.toml pyproject.toml
        sed -i "s/name = \"\"/name = \"${PWD##*/}\"/g" pyproject.toml
    fi
    if [[ "$1" != "--no-pkg" ]] && [[ "$2" != "--no-pkg" ]] ; then
        mkdir -p src/${PWD##*/}
        touch src/${PWD##*/}/__init__.py
        touch src/${PWD##*/}/__main__.py
    fi
    pip install --upgrade pip
    if [[ "$1" != "--no-dev" ]] && [[ "$2" != "--no-dev" ]] ; then
        pip install -r ~/.config/cw/dotfile/py/dev-requirements.txt
    fi
}

ppr() {
    __python_local_invoke python3 $@
}

ppd() {
    __python_local_invoke pudb3 $@
}

ppi() {
    pip install -e .
}


vim() {
    __check_activate_python_venv
    /usr/bin/env vim "$@"
}

# activate python virtualenv in new shells
__check_activate_python_venv
