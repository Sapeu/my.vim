#!/usr/bin/env bash
clone(){
	REPOSRC=$1
	LOCALREPO=$2

  # We do it this way so that we can abstract if from just git later on
	LOCALREPO_VC_DIR=$LOCALREPO/.git

	if [[ ! -d $LOCALREPO_VC_DIR ]]
	then
		git clone --depth 1 $REPOSRC $LOCALREPO
	else
		cd $LOCALREPO
		git pull $REPOSRC
	fi
}

clone https://github.com/yianwillis/vimcdoc ~/.vim/pack/docs/start/vimcdoc
clone https://github.com/joshdick/onedark.vim ~/.vim/pack/colors/opt/onedark.vim
clone https://github.com/sheerun/vim-polyglot ~/.vim/pack/plugins/start/vim-polyglot
clone https://github.com/vim-airline/vim-airline ~/.vim/pack/plugins/start/vim-airline

mkdir -p ~/.vim/autoload/lightline/colorscheme/
rm ~/.vim/autoload/lightline/colorscheme/onedark.vim
ln -s ~/.vim/pack/colors/opt/onedark.vim/autoload/lightline/colorscheme/onedark.vim ~/.vim/autoload/lightline/colorscheme/
