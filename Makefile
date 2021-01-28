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
		i3-wallpapers\
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
	 i3-wallpapers\
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
	mkdir -p ${I3DIR}
	ln -sv $</config ${I3DIR}/config

	mkdir -p ${I3DIR}/scripts
	-@for file in $(call ignore, $(wildcard $</scripts/*)) ; do\
		ln -sv $${file} ${I3DIR}/scripts/$$(basename $${file});\
	done

i3-wallpapers: ${PWD}/i3
	mkdir -p ${I3DIR}/wallpapers
	-@for file in $(call ignore, $(wildcard $</wallpapers/*)) ; do\
		ln -sv $${file} ${I3DIR}/wallpapers/$$(basename $${file});\
	done

nvim: ${PWD}/nvim
	mkdir -p ${NVIMDIR}
	
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

	ln -sv $</init.vim ${NVIMDIR}/init.vim

	mkdir -p ${NVIMDIR}/syntax
	ln -sv $</syntax/c.vim ${NVIMDIR}/syntax/c.vim

	mkdir -p ${NVIMDIR}/after/syntax
	ln -sv $</after/syntax/javascript.vim ${NVIMDIR}/after/syntax/javascript.vim

polybar: ${PWD}/polybar
	mkdir -p ${POLYBARDIR}
	
	ln -sv $</config.ini ${POLYBARDIR}/config.ini
	ln -sv $</launch.sh ${POLYBARDIR}/launch.sh
	ln -sv $</themes ${POLYBARDIR}/themes

rofi: ${PWD}/rofi
	mkdir -p ${ROFIDIR}
	
	ln -sv $</config.rasi ${ROFIDIR}/config.rasi
	ln -sv $</scripts ${ROFIDIR}/scripts
	ln -sv $</themes ${ROFIDIR}/themes

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
