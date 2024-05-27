#
# ZSH interactive shell
#

command -v unbound-host >/dev/null 2>&1 && alias host=unbound-host

[ "${ZDOTDIR:-}" = "$HOME" ] || ZSH="${ZSH:-${ZDOTDIR:+$ZDOTDIR/ohmyzsh}}"
export ZSH="${ZSH:-$HOME/.oh-my-zsh}"

COMPLETION_WAITING_DOTS='true'
plugins=(colored-man-pages)
DISABLE_AUTO_UPDATE='true'

SHOW_AWS_PROMPT=false

if [ -d "${HOME}/.starship/bin" ]; then
	PATH="${PATH}:${HOME}/.starship/bin"
	export PATH
fi

command -v ansible   >/dev/null 2>&1 && plugins+=(ansible)
command -v aws       >/dev/null 2>&1 && plugins+=(aws)
command -v direnv    >/dev/null 2>&1 && plugins+=(direnv)
command -v docker    >/dev/null 2>&1 && plugins+=(docker)
command -v eza       >/dev/null 2>&1 && plugins+=(eza)
command -v fzf       >/dev/null 2>&1 && plugins+=(fzf)
command -v git       >/dev/null 2>&1 && plugins+=(git)
command -v helm      >/dev/null 2>&1 && plugins+=(helm)
command -v httpie    >/dev/null 2>&1 && plugins+=(httpie)
command -v kubectl   >/dev/null 2>&1 && plugins+=(kubectl)
command -v python3   >/dev/null 2>&1 && plugins+=(python)
command -v ruby      >/dev/null 2>&1 && plugins+=(ruby)
command -v rustc     >/dev/null 2>&1 && plugins+=(rust)
command -v starship  >/dev/null 2>&1 && plugins+=(starship)
command -v terraform >/dev/null 2>&1 && plugins+=(terraform)
command -v vagrant   >/dev/null 2>&1 && plugins+=(vagrant)

for f in "${ZSH}/oh-my-zsh.sh" \
         "${ZDOTDIR:-$HOME}/.zshrc.local" \
         "${ZDOTDIR:-$HOME}/.iterm2_shell_integration.zsh"; do
	test -r "$f" && source "$f"
done
