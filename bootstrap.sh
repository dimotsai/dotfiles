BASEPATH=`dirname $0`

git pull origin master

pushd $BASEPATH

# copy dotfiles
cp -n .tmux.conf \
  .vimrc.local \
  .gitconfig \
  .npmrc \
  .zshrc ${HOME}

popd

# install oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ${HOME}/.oh-my-zsh

# install tmux-themepack
git clone https://github.com/jimeh/tmux-themepack.git ${HOME}/.tmux-themepack

# install spf13-vim
curl https://j.mp/spf13-vim3 -L -o - | sh

# setup git
read -p "git username: " GIT_USERNAME
read -p "git email: " GIT_EMAIL
git config --global user.name "${GIT_USERNAME}"
git config --global user.email "${GIT_EMAIL}"

# done
echo 'You are good to go now! :)'
chsh -s /bin/zsh
