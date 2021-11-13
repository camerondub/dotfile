#!/bin/bash
# environment install script for global config
##############################################


# resolve target deploy directory
if [ "$#" -eq 1 ]; then
	targetdir=$1
elif [ "$#" -eq 0 ]; then
	targetdir=$HOME
else
	echo "error: must pass 0 or 1 arguments"
	exit 1
fi

# resolve relative path from target to the directory this script is in
thisdir=$(python3 -c "import os.path; print(os.path.abspath('$(dirname ${BASH_SOURCE[0]})'))")
relpath=$(python3 -c "import os.path; print(os.path.relpath('${thisdir}', '${targetdir}'))")

# remove old links
rm -f ${targetdir}/.bashrc ${targetdir}/.gitconfig ${targetdir}/.gitignore ${targetdir}/.dircolors
rm -f ${targetdir}/.tmux.conf ${targetdir}/.gdbinit ${targetdir}/.ackrc ${targetdir}/.pylintrc
rm -f ${targetdir}/.invoke.yaml ${targetdir}/.clang-format 

# install new links
ln -s ${relpath}/.bashrc ${targetdir}/.bashrc
ln -s ${relpath}/.gitconfig ${targetdir}/.gitconfig
ln -s ${relpath}/.gitignore ${targetdir}/.gitignore
ln -s ${relpath}/.dircolors ${targetdir}/.dircolors
ln -s ${relpath}/.tmux.conf ${targetdir}/.tmux.conf
ln -s ${relpath}/.gdbinit ${targetdir}/.gdbinit
ln -s ${relpath}/.ackrc ${targetdir}/.ackrc
ln -s ${relpath}/python/.pylintrc ${targetdir}/.pylintrc
ln -s ${relpath}/python/.invoke.yaml ${targetdir}/.invoke.yaml
ln -s ${relpath}/cpp/.clang-format ${targetdir}/.clang-format

# scan bin folders and install
source ${thisdir}/bin/scanbin

# allow symlinked directories to work properly with tabcomplete
if ! grep -sq "set mark-symlinked-directories on" ~/.inputrc; then
	echo "set mark-symlinked-directories on" >> ~/.inputrc
fi

sudo apt install python3-pip python3-virtualenv python3-git exuberant-ctags
