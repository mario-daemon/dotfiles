# Install package
pac() {
	if [[ $1 == "-h" || $1 == "--help" ]]; then
		echo "pac: Install package"
		return 0
	fi
    local pkgs
    pkgs=$(pacman -Ss | fzf -m | awk '{print $1}' | cut -d'/' -f2) || return 0
    [ -n "$pkgs" ] && sudo pacman -S $pkgs
}

# Search info about a package
pacs() {
	if [[ $1 == "-h" || $1 == "--help" ]]; then
		echo "pacs: Search info about a remote package"
		return 0
	fi
    local pkgs
    pkgs=$(pacman -Ss | fzf -m | awk '{print $1}' | cut -d'/' -f2) || return 0
    [ -n "$pkgs" ] && pacman -Si $pkgs
}

# Remove package
pacrm() {
	if [[ $1 == "-h" || $1 == "--help" ]]; then
		echo "pacrm: Remove package"
		return 0
	fi
    local pkgs
    pkgs=$(pacman -Qq | fzf -m) || return 0
    [ -n "$pkgs" ] && sudo pacman -Rns $pkgs
}

# Get info about installed package
pacq() {
	if [[ $1 == "-h" || $1 == "--help" ]]; then
		echo "pacq: Query info about a local package"
		return 0
	fi
    local pkgs
    pkgs=$(pacman -Qq | fzf -m) || return 0
    [ -n "$pkgs" ] && pacman -Qikk $pkgs
}

# Get info about explicitly installed package
pacqe() {
	if [[ $1 == "-h" || $1 == "--help" ]]; then
		echo "pacqe: Query info about a local, explicitly installed, package"
		return 0
	fi
    local pkgs
    pkgs=$(pacman -Qqe | fzf -m) || return 0
    [ -n "$pkgs" ] && pacman -Qikk $pkgs
}
