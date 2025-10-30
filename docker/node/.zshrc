[ -d "${HOME}/.config/zsh/ohmyzsh" ] && export ZSH="${HOME}/.config/zsh/ohmyzsh"
[ -d "${HOME}/.oh-my-zsh" ] && export ZSH="${HOME}/.oh-my-zsh"
[ -f "${ZSH}/custom.plugins.zsh" ] && zsh "${ZSH}/custom.plugins.zsh"
ZSH_THEME="freegull"
plugins=(command-time copyfile dirhistory git zsh-autosuggestions zsh-syntax-highlighting)
source ${ZSH}/oh-my-zsh.sh
