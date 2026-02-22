# Install package
pac() {
    local pkgs
    pkgs=$(pacman -Ss | fzf -m | awk '{print $1}' | cut -d'/' -f2) || return 0
    [ -n "$pkgs" ] && sudo pacman -S $pkgs
	if [[ $1 -eq "-h" || $1 -eq "--help" ]]; then
		echo "pac: Install package"
	fi
}

# Search info about a package
pacs() {
    local pkgs
    pkgs=$(pacman -Ss | fzf -m | awk '{print $1}' | cut -d'/' -f2) || return 0
    [ -n "$pkgs" ] && pacman -Si $pkgs
	if [[ $1 -eq "-h" || $1 -eq "--help" ]]; then
		echo "pacs: Search info about a remote package"
	fi
}

# Remove package
pacrm() {
    local pkgs
    pkgs=$(pacman -Qq | fzf -m) || return 0
    [ -n "$pkgs" ] && sudo pacman -Rns $pkgs
	if [[ $1 -eq "-h" || $1 -eq "--help" ]]; then
		echo "pacrm: Remove package"
	fi
}

# Get info about installed package
pacq() {
    local pkgs
    pkgs=$(pacman -Qq | fzf -m) || return 0
    [ -n "$pkgs" ] && pacman -Qikk $pkgs
	if [[ $1 -eq "-h" || $1 -eq "--help" ]]; then
		echo "pacq: Query info about a local package"
	fi
}

# Get info about explicitly installed package
pacqe() {
    local pkgs
    pkgs=$(pacman -Qqe | fzf -m) || return 0
    [ -n "$pkgs" ] && pacman -Qikk $pkgs
	if [[ $1 -eq "-h" || $1 -eq "--help" ]]; then
		echo "pacqe: Query info about a local, explicitly installed, package"
	fi
}
