BINDIR=${HOME}/.local/bin
FONTSDIR=${HOME}/.local/share/fonts
CONFIGDIR=${HOME}/.config

OUTDIRS=${BINDIR}\
		${FONTSDIR}\
		${CONFIGDIR}

$(info $(shell mkdir -p $(OUTDIRS)))

.PHONY: bin\
		fonts\
		git\
		i3\
		nvim\
		polybar\
		rofi\
		xfce4\
		xorg\
		zsh

all: bin\
	 fonts\
	 git\
	 i3\
	 nvim\
	 polybar\
	 rofi\
	 xorg\
	 zsh

define ignore
	$(filter-out %.ignore,$(1))
endef

bin: ${PWD}/bin/*
	-@for file in $(call ignore, $^) ; do\
		echo ln -sv $${file} ${BINDIR}/$$(basename $${file});\
	done

fonts: ${PWD}/fonts/*
	-@for file in $(call ignore, $^) ; do\
		echo ln -sv $${file} ${FONTSDIR}/$$(basename $${file});\
	done

git: ${PWD}/git
	@echo ln -sv $</gitconfig ${HOME}/.gitconfig

i3: ${PWD}/i3
	@echo mkdir -p ${CONFIGDIR}/i3
	@echo ln -sv $</config ${CONFIGDIR}/i3/config

	@echo mkdir -p ${CONFIGDIR}/i3/scripts
	-@for file in $(call ignore, $(wildcard $</scripts/*)) ; do\
		echo ln -sv $${file} ${CONFIGDIR}/i3/scripts/$$(basename $${file});\
	done

nvim: ${PWD}/nvim
	@echo mkdir -p ${CONFIGDIR}/nvim
	@echo ln -sv $</init.vim ${CONFIGDIR}/nvim/init.vim

	@echo mkdir -p ${CONFIGDIR}/nvim/syntax
	@echo ln -sv $</syntax/c.vim ${CONFIGDIR}/nvim/syntax/c.vim

	@echo mkdir -p ${CONFIGDIR}/nvim/after/syntax
	@echo ln -sv $</after/syntax/javascript.vim ${CONFIGDIR}/nvim/after/syntax/javascript.vim

polybar:
	@echo polybar

rofi:
	@echo rofi

xorg: ${PWD}/xorg/*
	-@for file in $(call ignore, $^) ; do\
		echo ln -sv $${file} ${HOME}/.$$(basename $${file});\
	done

zsh: ${PWD}/zsh/*
	-@for file in $(call ignore, $^) ; do\
		echo ln -sv $${file} ${HOME}/.$$(basename $${file});\
	done