all:
	stow --dotfiles --verbose --target=$$HOME --restow .

delete:
	stow --dotfiles --verbose --target=$$HOME --delete .
