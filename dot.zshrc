#
# ZSH interactive shell
#

# Enable Powerlevel10k instant prompt. Should stay close to the top.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

command -v unbound-host >/dev/null 2>&1 && alias host=unbound-host

[ "${ZDOTDIR:-}" = "$HOME" ] || ZSH="${ZSH:-${ZDOTDIR:+$ZDOTDIR/ohmyzsh}}"
export ZSH="${ZSH:-$HOME/.oh-my-zsh}"

ZSH_THEME='powerlevel10k/powerlevel10k'
COMPLETION_WAITING_DOTS='true'
plugins=(colored-man-pages)
DISABLE_AUTO_UPDATE='true'

command -v ansible   >/dev/null 2>&1 && plugins+=(ansible)
command -v docker    >/dev/null 2>&1 && plugins+=(docker)
command -v fzf       >/dev/null 2>&1 && plugins+=(fzf)
command -v git       >/dev/null 2>&1 && plugins+=(git)
command -v helm      >/dev/null 2>&1 && plugins+=(helm)
command -v httpie    >/dev/null 2>&1 && plugins+=(httpie)
command -v kubectl   >/dev/null 2>&1 && plugins+=(kubectl)
command -v python3   >/dev/null 2>&1 && plugins+=(python)
command -v ruby      >/dev/null 2>&1 && plugins+=(ruby)
command -v rustc     >/dev/null 2>&1 && plugins+=(rust)
command -v terraform >/dev/null 2>&1 && plugins+=(terraform)
command -v vagrant   >/dev/null 2>&1 && plugins+=(vagrant)

for f in "${ZSH}/oh-my-zsh.sh" \
         "${ZDOTDIR:-$HOME}/.p10k.zsh" \
         "${ZDOTDIR:-$HOME}/.zshrc.local" \
         "${ZDOTDIR:-$HOME}/.iterm2_shell_integration.zsh"; do
	test -r "$f" && source "$f"
done
