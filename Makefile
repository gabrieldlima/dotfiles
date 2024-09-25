.PHONY: all home aorus awesome

all:
	nixos-rebuild switch --flake .#aorus && home-manager switch --flake .#gabriel@aorus

home:
	home-manager switch --flake .#gabriel@aorus

aorus:
	nixos-rebuild switch --flake .#aorus

awesome:
	ln -sf $$HOME/dev/dotfiles/home/config/awesome $$HOME/.config/awesome
