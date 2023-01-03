# lunarvim-config-manual (Windows)
## HOME
![home!](img/dashboard.png)
## Lakukan clone dari lunarvim 
```
git clone https://github.com/LunarVim/LunarVim.git "$env:LOCALAPPDATA\nvim"
git clone https://github.com/pojokcodeid/lunarvim-config-manual.git "$env:LOCALAPPDATA\nvim\lua\user"
```
## Lakukan Call Function pada file nvim/config.lua  paling bawah 
```
require("user.config")
```
## Copy Snippet 
```
 Copy-Item -Path "$env:LOCALAPPDATA\nvim\lua\user\snippets" -Destination "$env:LOCALAPPDATA\nvim\snippets" -Recurse
```
