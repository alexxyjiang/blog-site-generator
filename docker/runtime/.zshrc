[ -d "${ZDOTDIR}/ohmyzsh" ] && export ZSH="${ZDOTDIR}/ohmyzsh"
[ -d "${HOME}/.oh-my-zsh" ] && export ZSH="${HOME}/.oh-my-zsh"
[ -f "${ZSH}/custom.plugins.zsh" ] && zsh "${ZSH}/custom.plugins.zsh"
ZSH_THEME="dallas"
plugins=(command-time dirhistory zsh-autosuggestions zsh-syntax-highlighting git)
source ${ZSH}/oh-my-zsh.sh
