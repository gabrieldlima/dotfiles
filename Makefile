.PHONY: all home aorus

default:
	home-manager switch --flake .#gabriel@aorus

aorus:
	sudo nixos-rebuild switch --flake .#aorus
