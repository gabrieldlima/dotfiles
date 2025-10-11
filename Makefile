.PHONY: all home aorus

all:
	sudo nixos-rebuild switch --flake .#aorus && home-manager switch --flake .#gabriel@aorus

home:
	home-manager switch --flake .#gabriel@aorus

aorus:
	sudo nixos-rebuild switch --flake .#aorus
