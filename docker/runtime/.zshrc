[ -d "$ZDOTDIR/ohmyzsh" ] && export ZSH="$ZDOTDIR/ohmyzsh"
[ -d "$HOME/.oh-my-zsh" ] && export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="dallas"
plugins=(command-time dirhistory zsh-autosuggestions zsh-syntax-highlighting git)
source $ZSH/oh-my-zsh.sh
