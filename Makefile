# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Symlink configs in ~/
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
default:
	stow -R */

clean:
	stow --delete */

test:
	stow -R --target=/tmp */


# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Install packages after fresh FreeBSD installation
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
.PHONY: freebsd
freebsd:
	pkg install \
		alacritty \
		dmenu \
		doas\
		fastfetch \
		git \
		i3 \
		i3status \
		iosevka \
		picom \
		qutebrowser \
		stow \
		xclip \
		xclipboard \
		xorg \


# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Install packages after fresh Void Linux installation
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
.PHONY: void
void:
	xbps-install -Su \
		alacritty \
		base-devel \
		cmake \
		dmenu \
		git \
		i3 \
		i3status-rust \
		libdrm-32bit \
		libgcc-32bit \
		libglvnd-32bit \
		libstdc++-32bit \
		MangoHud \
		mesa-dri-32bit \
		mesa-vaapi mesa-vdpau \
		mesa-vulkan-radeon \
		pavucontrol \
		picom \
		pulseaudio \
		qutebrowser \
		ripgrep \
		steam \
		stow \
		tmux \
		void-repo-multilib \
		void-repo-multilib-nonfree \
		void-repo-nonfree \
		vulkan-loader \
		xorg \
		yazi \
