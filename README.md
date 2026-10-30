# dotfiles

My macOS dotfiles: zsh, git, kitty and AeroSpace.

## What's inside

`make install` symlinks each file into place:

| Repo path                  | Linked to                               | Notes                                                       |
| -------------------------- | --------------------------------------- | ----------------------------------------------------------- |
| `zsh/zshrc`                | `~/.zshrc`                              | Oh My Zsh (`candy` theme), toolchain PATHs, `tips`/`wmkeys` |
| `git/gitconfig`            | `~/.gitconfig`                          | GPG-signed commits and tags, includes `~/.gitconfig.local`  |
| `kitty/kitty.conf`         | `~/.config/kitty/kitty.conf`            | Hasklug Nerd Font Mono                                      |
| `kitty/current-theme.conf` | `~/.config/kitty/current-theme.conf`    | Kitty theme                                                 |
| `aerospace/aerospace.toml` | `~/.config/aerospace/aerospace.toml`    | i3-style tiling, mod key = alt                              |

## Install

```sh
git clone git@github.com:Canciller/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
make install
```

The installer is safe to re-run. Links that are already correct are left alone, and any existing file in the way is moved to `~/.dotfiles-backup/<timestamp>/` before linking.

## Install the tools

Everything is installed with [Homebrew](https://brew.sh/):

```sh
brew install --HEAD neovim
brew install --cask kitty nikitabobko/tap/aerospace
```

- [Neovim](https://neovim.io/) is the editor, used as `$EDITOR` when `nvim` is available. I run the nightly (HEAD) build, which `brew upgrade --fetch-HEAD neovim` updates. Its config lives in its own repo, [Canciller/nvim-config](https://github.com/Canciller/nvim-config) (see [Neovim config](#neovim-config)). It needs a Nerd Font for icons (see [Font](#font)).
- [kitty](https://sw.kovidgoyal.net/kitty/) is the terminal. It uses the Hasklug Nerd Font (see [Font](#font)).
- [AeroSpace](https://github.com/nikitabobko/AeroSpace) is the tiling window manager.

## Neovim config

The Neovim config is not in this repo. Clone it and link it into place:

```sh
mkdir -p ~/Projects ~/.config
git clone git@github.com:Canciller/nvim-config.git ~/Projects/nvim-config
ln -s ~/Projects/nvim-config ~/.config/nvim
```

## Prerequisites

- [Oh My Zsh](https://ohmyz.sh/#install) (zsh itself already ships with macOS)
- A GPG key and `~/.gitconfig.local` for signed commits (see [Signed commits](#signed-commits))

## Font

kitty is set to `Hasklug Nerd Font Mono`, the [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hasklig) patch of Hasklig. Neovim needs a Nerd Font for its icons, so it relies on kitty using this one.

To install it, download `Hasklig.zip` from the [Nerd Fonts releases](https://github.com/ryanoasis/nerd-fonts/releases/latest), copy the font files into `~/Library/Fonts`, then restart kitty.

Check that kitty sees it:

```sh
kitty +list-fonts | grep -i hasklug
```

## Signed commits

`git/gitconfig` turns on `commit.gpgsign` and `tag.gpgsign` and includes `~/.gitconfig.local`, which isn't tracked and holds the machine-specific signing settings.

1. Install GPG and a pinentry program for the passphrase prompt:

   ```sh
   brew install gnupg pinentry-mac
   echo "pinentry-program $(brew --prefix)/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
   gpgconf --kill gpg-agent
   ```

2. Generate a key (RSA 4096) using the same email as in `git/gitconfig`:

   ```sh
   gpg --full-generate-key
   ```

3. Find the key ID, which is the part after `rsa4096/`:

   ```sh
   gpg --list-secret-keys --keyid-format=long
   ```

4. Create `~/.gitconfig.local`:

   ```ini
   [user]
     signingkey = <KEY_ID>

   [gpg]
     program = /opt/homebrew/bin/gpg
   ```

5. Add the public key to GitHub (Settings -> SSH and GPG keys):

   ```sh
   gpg --armor --export <KEY_ID> | pbcopy
   ```

6. Check that commits are signed:

   ```sh
   git commit --allow-empty -m "test signing"
   git log --show-signature -1
   ```

Back up the private key somewhere safe, because it can't be recovered if lost:

```sh
gpg --export-secret-keys --armor <KEY_ID> > gpg-private-key.asc
```

## Cheat sheets

Open a new shell, or run these:

- `tips` lists the tools and aliases I tend to forget (it also runs on every interactive shell).
- `wmkeys` shows the AeroSpace keybinds.

## License

[MIT](LICENSE)
