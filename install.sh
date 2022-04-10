#!/usr/bin/env bash
exists_clone(){
	remote_path=$1
	local_path=$2

	if [[ ! -d $local_path/.git ]]
	then
		git clone --depth 1 $remote_path $local_path
	else
		cd $local_path
		git pull $remote_path
	fi
}

exists_clone https://github.com/Sapeu/my.vim.git ~/.vim
exists_clone https://github.com/yianwillis/vimcdoc ~/.vim/pack/docs/start/vimcdoc
exists_clone https://github.com/joshdick/onedark.vim ~/.vim/pack/colors/opt/onedark.vim
exists_clone https://github.com/sheerun/vim-polyglot ~/.vim/pack/plugins/start/vim-polyglot
exists_clone https://github.com/vim-airline/vim-airline ~/.vim/pack/plugins/start/vim-airline
exists_clone https://github.com/rust-lang/rust.vim ~/.vim/pack/plugins/start/rust.vim
exists_clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
exists_clone https://github.com/preservim/nerdcommenter.git ~/.vim/pack/vendor/start/nerdcommenter

mkdir -p ~/.vim/autoload/lightline/colorscheme/
rm -f ~/.vim/autoload/lightline/colorscheme/onedark.vim
ln -s ~/.vim/pack/colors/opt/onedark.vim/autoload/lightline/colorscheme/onedark.vim ~/.vim/autoload/lightline/colorscheme/
