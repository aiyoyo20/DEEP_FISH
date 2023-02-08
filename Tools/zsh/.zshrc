# If you come from bash you might have to change your $PATH.
# oh-my-zsh setting start
DISABLE_AUTO_UPDATE=true
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="jonathan"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions autojump)

source $ZSH/oh-my-zsh.sh
# oh-my-zsh setting end

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# 加载自定义配置
# .profile 不用导入，bash 和 zsh 都会自动导入
# source ~/.profile
