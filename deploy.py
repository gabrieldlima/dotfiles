import os
import subprocess
import shutil

home = os.environ['USERPROFILE']


# ==============================================================================
# Create folders
# ==============================================================================
if not os.path.exists(fr"{home}\Documents\Powershell"):
    os.mkdir(fr"{home}\Documents\Powershell")

if not os.path.exists(fr"{home}\.config"):
    os.mkdir(fr"{home}\.config");

if not os.path.exists(fr"{home}\.local"):
    os.mkdir(fr"{home}\.local");


# ==============================================================================
# Symlink farm definition
# ==============================================================================
bat_src = fr"{home}\.dotfiles\config\bat"
bat_dst = fr"{home}\AppData\Roaming\bat"

git_src = fr"{home}\.dotfiles\config\git\config"
git_dst = fr"{home}\.gitconfig"

nushell_src = fr"{home}\.dotfiles\config\nushell"
nushell_dst = fr"{home}\AppData\Roaming\nushell"

powershell_src = fr"{home}\.dotfiles\config\powershell\profile.ps1"
powershell_dst = fr"{home}\Documents\Powershell\Microsoft.PowerShell_profile.ps1"

starship_src = fr"{home}\.dotfiles\config\starship\starship.toml"
starship_dst = fr"{home}\.config\starship.toml"

vsvim_src = fr"{home}\.dotfiles\config\vim\.vimrc"
vsvim_dst = fr"{home}\.vsvimrc"

wezterm_src = fr"{home}\.dotfiles\config\wezterm\config.lua"
wezterm_dst = fr"{home}\.wezterm.lua"

wt_src = fr"{home}\.dotfiles\config\wt\settings.json"
wt_dst = fr"{home}\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

zed_src = fr"{home}\.dotfiles\config\zed"
zed_dst = fr"{home}\AppData\Roaming\Zed"


# ==============================================================================
# Symlink farm creation
# ==============================================================================
def symlink(destination, source):
    if os.path.lexists(destination):
        if os.path.isdir(destination) and not os.path.islink(destination):
            shutil.rmtree(destination)
        else:
            os.remove(destination)

    mklink_flag = "/D" if os.path.isdir(source) else ""

    cmd = ["cmd", "/c", "mklink"]
    if mklink_flag:
        cmd.append(mklink_flag)
    cmd.extend([destination, source])

    subprocess.run(cmd, check=True)

symlink(bat_dst, bat_src)
symlink(git_dst, git_src)
symlink(nushell_dst, nushell_src)
symlink(powershell_dst, powershell_src)
symlink(starship_dst, starship_src)
symlink(vsvim_dst, vsvim_src)
symlink(wezterm_dst, wezterm_src)
symlink(wt_dst, wt_src)
symlink(zed_dst, zed_src)


# ==============================================================================
# Install package with winget
# ==============================================================================
def winget(package):
    cmd = ["winget", "install", "--exact", f"--id={package}"]
    subprocess.run(cmd)

winget("7zip.7zip")
winget("AgileBits.1Password")
winget("Ajeetdsouza.zoxide")
winget("BurntSushi.ripgrep.MSVC")
winget("CloudFlare.warp")
winget("Discord.Discord")
winget("Fastfetch-cli.Fastfetch")
winget("Guru3D.RTSS")
winget("Kitware.CMake")
winget("LLVM.LLVM")
winget("Logitech.GHUB")
winget("Microsoft.PowerShell")
winget("Microsoft.PowerToys")
winget("Microsoft.VisualStudio.Community.Insiders")
winget("Nushell.Nushell")
winget("RamenSoftware.Windhawk")
winget("Sharkdp.bat")
winget("Sharkdp.fd")
winget("Starship.Starship")
winget("Sxyazi.yazi")
winget("Valve.Steam")
winget("Wacom.WacomTabletDriver")
winget("Zen-Team.Zen-Browser")
