#!/usr/bin/env bash

BASEDIR=$(dirname $0)

DIR_OH_MY_ZSH=${HOME}/.oh-my-zsh
DIR_TPM=${HOME}/.tmux/plugins/tpm

pushd $BASEDIR > /dev/null

git pull origin master

# copy dotfiles
cp -n .tmux.conf \
  .gitconfig \
  .npmrc \
  .zshrc ${HOME}


# install oh-my-zsh
if [ -d ${DIR_OH_MY_ZSH}/.git ]; then
  git -C ${DIR_OH_MY_ZSH} pull
else
  git clone https://github.com/robbyrussell/oh-my-zsh.git ${DIR_OH_MY_ZSH}
fi

# install tpm
if [ -d ${DIR_TPM}/.git ]; then
  git -C ${DIR_TPM} pull
else
  git clone https://github.com/tmux-plugins/tpm ${DIR_TPM}
fi

# install space-vim
bash <(curl -fsSL https://raw.githubusercontent.com/liuchengxu/space-vim/master/install.sh)

# setup git
read -p "git username: " GIT_USERNAME
read -p "git email: " GIT_EMAIL
git config --global user.name "${GIT_USERNAME}"
git config --global user.email "${GIT_EMAIL}"

# done
echo 'You are good to go now! :)'

popd > /dev/null

chsh -s $(which zsh)
