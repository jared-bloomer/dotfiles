if [ -f ~/.bashrc ]; then . ~/.bashrc; fi 

# For Terraform locally
#export TF_VAR_ignore_tags='["cai:catalog", "coxauto-ssm", "coxauto:ssm"]'

##
# Your previous /Users/jlbloomer/.bash_profile file was backed up as /Users/jlbloomer/.bash_profile.macports-saved_2017-02-08_at_15:21:17
##

# MacPorts Installer addition on 2017-02-08_at_15:21:17: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH

# Setting Groovy_Home Var
export GROOVY_HOME=/usr/local/opt/groovy/libexec

# Setting openjdk PATH
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Setting PATH for mysql-client
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# This is for Ansible 2.9
#export PATH="/opt/homebrew/opt/ansible@2.9/bin:$PATH"

# For Go
PATH="/Users/jared.bloomer/go/bin:$PATH"

# For rbenv
eval "$(rbenv init -)"

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# Created by `pipx` on 2024-02-28 15:34:54
export PATH="$PATH:/Users/jared.bloomer/.local/bin"
PATH="$(bash --norc -ec 'IFS=:; paths=($PATH); 
for i in ${!paths[@]}; do 
if [[ ${paths[i]} == "''/Users/jared.bloomer/.pyenv/shims''" ]]; then unset '\''paths[i]'\''; 
fi; done; 
echo "${paths[*]}"')"
export PATH="/Users/jared.bloomer/.pyenv/shims:${PATH}"
export PYENV_SHELL=bash
source '/opt/homebrew/Cellar/pyenv/2.4.3/libexec/../completions/pyenv.bash'
command pyenv rehash 2>/dev/null
pyenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(pyenv "sh-$command" "$@")"
    ;;
  *)
    command pyenv "$command" "$@"
    ;;
  esac
}
