CONFIG=${HOME}/.config
LOCAL=${HOME}/.local

NVIMDIR=${CONFIG}/nvim

.PHONY: git\
	nvim\
	zsh

install: git\
	 nvim\
	 zsh

zsh: ${PWD}/zsh
	ln -sv $</zshrc ${HOME}/.zshrc
	ln -sv $</zshenv ${HOME}/.zshenv

git: ${PWD}/git
	ln -sv $</gitconfig ${HOME}/.gitconfig

nvim: ${PWD}/nvim
	mkdir -p ${CONFIG}
	ln -sv $< ${NVIMDIR}

