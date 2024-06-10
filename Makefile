.PHONY: all home aorus awesome

all:
	nixos-rebuild switch --flake .#aorus && home-manager switch --flake .#gabriel@aorus

home:
	home-manager switch --flake .#gabriel@aorus

aorus:
	nixos-rebuild switch --flake .#aorus

awesome:
	ln -sf $$HOME/Development/dotfiles/home/gabriel/config/awesome $$HOME/.config/awesome
