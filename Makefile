.PHONY: all home aorus

all:
	nixos-rebuild switch --flake .#aorus && home-manager switch --flake .#gabriel@aorus

home:
	home-manager switch --flake .#gabriel@aorus

aorus:
	nixos-rebuild switch --flake .#aorus
