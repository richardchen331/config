set -e

# Set up temporary working directory

TMP_DIR='/tmp/config'

rm -rf $TMP_DIR

echo "\033[0;34mMac users, please install the following first: brew install wget reattach-to-user-namespace tmux\033[0m"

echo "\033[0;34mChecking required dependencies...\033[0m"
hash git >/dev/null 2>&1 || {
  echo "git not installed, please install using apt-get install git"
  exit
}
hash wget >/dev/null 2>&1 || {
  echo "wget not installed, please install using apt-get install wget"
  exit
}
hash curl >/dev/null 2>&1 || {
  echo "curl not installed, please install using apt-get install curl"
  exit
}
hash vim >/dev/null 2>&1 || {
  echo "vim not installed, please install using apt-get install vim"
  exit
}
hash zsh >/dev/null 2>&1 || {
  echo "zsh not installed, please install using apt-get install zsh"
  exit
}

echo "\033[0;34mCloning config repo...\033[0m"
git clone https://github.com/richardchen331/config.git $TMP_DIR
cd $TMP_DIR

# Set up zsh

if [ ! -n "$ZSH" ]; then
  ZSH=~/.oh-my-zsh
fi

echo "\033[0;34mChecking oh-my-zsh...\033[0m"
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
  echo "\033[0;33mFound ~/.zshrc.\033[0m \033[0;32mBacking up to ~/.zshrc.bak\033[0m";
  mv ~/.zshrc ~/.zshrc.bak
else
  echo "\033[0;34moh-my-zsh not found, installing now\033[0m"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "\033[0;34mCopying zsh theme from repo...\033[0m"
cp richardchen.zsh-theme $ZSH/themes

echo "\033[0;34mChecking for zsh-syntax-highlighting...\033[0m"
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
  echo "\033[0;34mzsh-syntax-highlighting not found, installing now\033[0m"
  cd ~/.oh-my-zsh/custom/plugins
  git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
  cd $TMP_DIR
fi

echo "\033[0;34mCopying zsh config from repo...\033[0m"
cp zshrc ~/.zshrc

# Set up vim

echo "\033[0;34mChecking for vim pathogen...\033[0m"
if [ ! -f ~/.vim/autoload/pathogen.vim ] && [ ! -h ~/.vim/autoload/pathogen.vim ]; then
  echo "\033[0;34mvim pathogen not found, installing now\033[0m"
  mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

echo "\033[0;34mChecking for vim solarized...\033[0m"
if [ ! -d ~/.vim/bundle/vim-colors-solarized ]; then
  echo "\033[0;34mvim solarized not found, installing now\033[0m"
  cd ~/.vim/bundle
  git clone git://github.com/altercation/vim-colors-solarized.git
  echo "\033[0;34mRemember to setup solaizied theme for iTerm\033[0m"
  cd $TMP_DIR
fi

echo "\033[0;34mLooking for an existing vim config...\033[0m"
if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
  echo "\033[0;33mFound ~/.vimrc.\033[0m \033[0;32mBacking up to ~/.vim.bak\033[0m";
  mv ~/.vimrc ~/.vimrc.bak
fi
echo "\033[0;34mCopying vim config from repo...\033[0m"
cp vimrc ~/.vimrc

echo "\033[0;34mLooking for an existing git config...\033[0m"
if [ -f ~/.gitconfig ] || [ -h ~/.gitconfig ]; then
  echo "\033[0;33mFound ~/.gitconfig.\033[0m \033[0;32mBacking up to ~/.gitconfig.bak\033[0m";
  mv ~/.gitconfig ~/.gitconfig.bak
fi
echo "\033[0;34mCopying git config from repo...\033[0m"
cp gitconfig ~/.gitconfig

echo "\033[0;34mLooking for an existing tmux config...\033[0m"
if [ -f ~/.tmux.conf ] || [ -h ~/.tmux.conf ]; then
  echo "\033[0;33mFound ~/.tmux.conf.\033[0m \033[0;32mBacking up to ~/.tmux.conf.bak\033[0m";
  mv ~/.tmux.conf ~/.tmux.conf.bak
fi
echo "\033[0;34mCopying tmux config from repo...\033[0m"
cp tmux.conf ~/.tmux.conf

echo "\033[0;34mSetting up Python3...\033[0m"
# https://developer.apple.com/metal/tensorflow-plugin/
# https://caffeinedev.medium.com/how-to-install-tensorflow-on-m1-mac-8e9b91d93706
echo "\033[0;34mInstalling conda environment first...\033[0m"
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-arm64.sh
chmod +x Miniforge3-MacOSX-arm64.sh
sh Miniforge3-MacOSX-arm64.sh
echo "\033[0;34mSetting up conda environment...\033[0m"
conda create --name dev3.9 python=3.9
echo "source activate dev" >> ~/.zshrc
conda install -c apple tensorflow-deps
echo "\033[0;34mInstalling python packages...\033[0m"
python3 -m pip install --upgrade pip setuptools wheel
python3 -m pip install -r requirements.txt

echo "\033[0;34mLooking for an existing jupyter notebook config...\033[0m"
if [ -f ~/.jupyter/jupyter_notebook_config.py ] || [ -h ~/.jupyter/jupyter_notebook_config.py ]; then
  echo "\033[0;33mFound ~/.jupyter/jupyter_notebook_config.py.\033[0m \033[0;32mBacking up to ~/.jupyter/jupyter_notebook_config.py.bak\033[0m";
  mv ~/.jupyter/jupyter_notebook_config.py ~/.jupyter/jupyter_notebook_config.py.bak
fi
echo "\033[0;34mCopying jupyter notebook config from repo...\033[0m"
if [ ! -d ~/.jupyter/ ]; then
  echo "\033[0;33m~/.jupyter/ does not exist, creating one\033[0m";
  mkdir ~/.jupyter/
fi
cp jupyter_notebook_config.py ~/.jupyter/jupyter_notebook_config.py
cp jupyterlab_notebook_extension_user_settings ~/.jupyter/lab/user-settings/@jupyterlab/notebook-extension/tracker.jupyterlab-settings

Clean up temporary working directory

rm -rf $TMP_DIR
