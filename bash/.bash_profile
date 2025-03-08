# .bash_profile

# If .bash_profile exists, bash doesn't read .profile
if [[ -f ~/.profile ]]; then
  . ~/.profile
fi

# If the shell is interactive and .bashrc exists, get the aliases and functions
if [[ $- == *i* && -f ~/.bashrc ]]; then
    . ~/.bashrc
fi


export BASH_SILENCE_DEPRECATION_WARNING=1

[[ -f ~/.bashrc ]] && source ~/.bashrc

eval "$(nodenv init - bash)"

