BINDIR=${HOME}/.local/bin
FONTSDIR=${HOME}/.local/share/fonts
CONFIGDIR=${HOME}/.config

OUTDIRS=${BINDIR}\
		${FONTSDIR}\
		${CONFIGDIR}

$(info $(shell mkdir -p $(OUTDIRS)))

I3DIR=${CONFIGDIR}/i3
POLYBARDIR=${CONFIGDIR}/polybar
ROFIDIR=${CONFIGDIR}/rofi

NVIMDIR=${CONFIGDIR}/nvim
VSCODEDIR=${CONFIGDIR}/Code/User

define ignore
	$(filter-out %.ignore,$(1))
endef

.PHONY: bin\
		fonts\
		git\
		i3\
		nvim\
		polybar\
		rofi\
		xfce4\
		xorg\
		zsh\
		vscode

install: bin\
	 fonts\
	 git\
	 i3\
	 nvim\
	 polybar\
	 rofi\
	 xorg\
	 zsh\
	 vscode

uninstall: uninstall-vscode

bin: ${PWD}/bin/*
	-@for file in $(call ignore, $^) ; do\
		ln -sv $${file} ${BINDIR}/$$(basename $${file});\
	done

fonts: ${PWD}/fonts/*
	-@for file in $(call ignore, $^) ; do\
		ln -sv $${file} ${FONTSDIR}/$$(basename $${file});\
	done

git: ${PWD}/git
	@ln -sv $</gitconfig ${HOME}/.gitconfig

i3: ${PWD}/i3
	@echo mkdir -p ${I3DIR}
	@echo ln -sv $</config ${I3DIR}/config

	@echo mkdir -p ${I3DIR}/scripts
	-@for file in $(call ignore, $(wildcard $</scripts/*)) ; do\
		echo ln -sv $${file} ${I3DIR}/scripts/$$(basename $${file});\
	done

nvim: ${PWD}/nvim
	@echo mkdir -p ${NVIMDIR}
	@echo ln -sv $</init.vim ${NVIMDIR}/init.vim

	@echo mkdir -p ${NVIMDIR}/syntax
	@echo ln -sv $</syntax/c.vim ${NVIMDIR}/syntax/c.vim

	@echo mkdir -p ${NVIMDIR}/after/syntax
	@echo ln -sv $</after/syntax/javascript.vim ${NVIMDIR}/after/syntax/javascript.vim

polybar:
	@echo polybar

rofi:
	@echo rofi

xorg: ${PWD}/xorg/*
	-@for file in $(call ignore, $^) ; do\
		ln -sv $${file} ${HOME}/.$$(basename $${file});\
	done

zsh: ${PWD}/zsh/*
	-@for file in $(call ignore, $^) ; do\
		ln -sv $${file} ${HOME}/.$$(basename $${file});\
	done

vscode: ${PWD}/vscode
	mkdir -p ${VSCODEDIR}
	
	-@ln -sv $</settings.json  ${VSCODEDIR}/settings.json;\
	ln -sv $</keybindings.json ${VSCODEDIR}/keybindings.json

uninstall-vscode:
	mv ${VSCODEDIR}/settings.json ${VSCODEDIR}/settings.json.old
	mv ${VSCODEDIR}/keybindings.json ${VSCODEDIR}/keybindings.json.old
	rm -f ${VSCODEDIR}/settings.json
	rm -f ${VSCODEDIR}/keybindings.json
