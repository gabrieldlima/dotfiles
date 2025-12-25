<h1 align="center">
 <img src="https://logospng.org/download/windows-11/logo-windows-11-icon-1024.png", height = 100>
  <br />
   Windows
</h1>

### Install:
```cmd
git clone https://github.com/gabrieldlima/dotfiles .dotfiles
cd .dotfiles
winget install --id=astral-sh.uv -e
uv python install
uv run deploy.py
```
