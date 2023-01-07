# lunarvim-config-manual

# HOME

![home!](img/dashboard.png)

# Kebutuhan dasar

1. Install Neovim 8.0+ https://github.com/neovim/neovim/releases/tag/v0.8.1
2. C++ Compiler https://www.msys2.org/
3. GIT https://git-scm.com/download/win
4. NodeJs https://nodejs.org/en/
5. Ripgrep https://github.com/BurntSushi/ripgrep
6. Lazygit https://github.com/jesseduffield/lazygit
7. Nerd Font https://github.com/ryanoasis/nerd-fonts
8. Windows Terminal https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701?hl=en-id&gl=id
9. Powershell https://apps.microsoft.com/store/detail/powershell/9MZ1SNWT0N5D?hl=en-id&gl=id

# Config Windows

## Pastikan Sudah Install Kebutuhan dasar diatas

## Lakukan clone dari lunarvim

```
git clone https://github.com/LunarVim/LunarVim.git "$env:LOCALAPPDATA\nvim"
git clone https://github.com/pojokcodeid/lunarvim-config-manual.git "$env:LOCALAPPDATA\nvim\lua\user"
```

## Lakukan Call Function pada file nvim/config.lua paling bawah

```
require("user.config")
```

## Copy Snippet

```
 Copy-Item -Path "$env:LOCALAPPDATA\nvim\lua\user\snippets" -Destination "$env:LOCALAPPDATA\nvim\snippets" -Recurse
```

## Copy untuk java di windows

```
Copy-Item -Path "$env:LOCALAPPDATA\nvim\lua\user\ftplugin" -Destination "$env:LOCALAPPDATA\nvim\ftplugin" -Recurse
```

# Linux (Debian Based)

## Pastikan Acess Administrator

```
visudo
[user name] ALL=(ALL:ALL) ALL
[user name] ALL=(ALL) NOPASSWD:ALL
```

## Install Neovim

```
sudo apt-get install wget
mkdir download
cd download
wget https://github.com/neovim/neovim/releases/download/v0.8.1/nvim-linux64.deb
sudo apt-get install ./nvim-linux64.deb
nvim --version
```

## Check GCC

```
gcc --version
```

## Install Git

```
sudo apt-get install git
git --version
```

## Install NodeJs

```
sudo apt-get install curl
sudo apt install build-essential libssl-dev
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
source ~/.bashrc
nvm install 18.12.1
node --version
npm --version
```

## Install unzip, repgrip dan Lazygit

```
sudo apt-get install unzip
sudo apt-get install ripgrep

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
lazygit --version
```

## Config

```
git clone https://github.com/LunarVim/LunarVim.git ~/.config/nvim
git clone https://github.com/pojokcodeid/lunarvim-config-manual.git ~/.config/nvim/lua/user
```

## Lakukan Call Function pada file nvim/config.lua paling bawah

```
require("user.config")
```

### Copy Snippets

```
 cp -r ~/.config/nvim/lua/user/snippets ~/.config/nvim/snippets
```

# Ubah Dasboard

## Cari file nvim/lua/user/config.lua - ubah code dibawah ini

```
val = {
      [[             _       _                    _      ]],
      [[            (_)     | |                  | |     ]],
      [[ _ __   ___  _  ___ | | __   ___ ___   __| | ___ ]],
      [[| '_ \ / _ \| |/ _ \| |/ /  / __/ _ \ / _` |/ _ \]],
      [[| |_) | (_) | | (_) |   <  | (_| (_) | (_| |  __/]],
      [[| .__/ \___/| |\___/|_|\_\  \___\___/ \__,_|\___|]],
      [[| |        _/ |                                  ]],
      [[|_|       |__/                                   ]],
    },
```

## Linik Generate Dashboard

https://patorjk.com/software/taag/
