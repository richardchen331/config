set -e

TMP_DIR='/tmp/config'

rm -rf $TMP_DIR

if [ ! -n "$ZSH" ]; then
  ZSH=~/.oh-my-zsh
fi

echo "\033[0;34mChecking zsh...\033[0m"
hash zsh >/dev/null 2>&1 || {
  echo "zsh not installed, please install using apt-get install zsh"
  exit
}

echo "\033[0;34mCloning config repo...\033[0m"
hash git >/dev/null 2>&1 && git clone https://github.com/richardchen331/config.git $TMP_DIR || {
  echo "git not installed"
  exit
}
cd $TMP_DIR

echo "\033[0;34mLooking for an existing zsh config...\033[0m"
if [ -f ~/.zshrc ] || [ -f ~/.zshrc ]; then
  echo "\033[0;33mFound ~/.zshrc.\033[0m \033[0;32mBacking up to ~/.zshrc.bak\033[0m";
	mv ~/.zshrc ~/.zshrc.bak
else
	echo "\033[0;34mzsh not found, installing now\033[0m"
	curl -L http://install.ohmyz.sh | sh
fi

echo "\033[0;34mCopying zsh config from repo...\033[0m"
cp zshrc ~/.zshrc

echo "\033[0;34mCopying zsh theme from repo...\033[0m"
cp richardchen.zsh-theme $ZSH/themes

echo "\033[0;34mTime to change your default shell to zsh!\033[0m"
chsh -s `which zsh`

echo "\033[0;34mLooking for an existing vim config...\033[0m"
if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
  echo "\033[0;33mFound ~/.vimrc.\033[0m \033[0;32mBacking up to ~/.vim.bak\033[0m";
	mv ~/.vimrc ~/.vimrc.bak
fi
echo "\033[0;34mCopying vim config from repo...\033[0m"
cp vimrc ~/.vimrc

rm -rf $TMP_DIR
