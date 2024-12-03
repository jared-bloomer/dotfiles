PATH=$PATH:$HOME/bin
eval "$(/opt/homebrew/bin/brew shellenv)"
export HISTTIMEFORMAT="%m/%d/%y %T "
export HISTFILESIZE=
export HISTSIZE=
export TFENV_ARCH=amd64 #Require for Terraform on m1 macbooks
export JAVA_HOME='/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home/'
export AWS_DEFAULT_REGION='us-east-1'

pybuild() {
	python setup.py register sdist upload
	twine upload dist/*
}

nsip() {
	nslIP=$(nslookup $1 | grep -oE 'Address: [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d':' -f2)
	echo -n "$1, "
	if [ ! -z $nslIP ]; then
		echo $nslIP
	else
		echo "IP Address not Found"
	fi
}

pkey() {
	echo "# $1"
	/usr/bin/ssh-keygen -y -f $1
}

free() {
    vm_stat | perl -ne '/page size of (\d+)/ and $size=$1; /Pages\s+([^:]+)[^\d]+(\d+)/ and printf("%-16s % 16.2f Mi\n", "$1:", $2 * $size / 1048576);'
}

grebase() {
  git stash
  git fetch --all
  git rebase upstream/master
  git push origin master
  git stash apply
}

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

alias gitup='gitup'
alias gitlog="git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s'"
alias pubip="curl http://ipecho.net/plain; echo"
alias ll="ls -Gla"
alias ls="ls -G"
alias passgen="uuidgen | md5 | cut -c1-20"
alias nokey="ssh -o PreferredAuthentications=keyboard-interactive,password -o PubkeyAuthentication=no"
alias dockerimageclean='docker rmi $(docker images -f "dangling=true" -q)'
alias ylintall='for i in $(ls *.yaml); do yaml-lint $i; done'
alias verifyssl="/bin/echo | /usr/bin/openssl s_client -servername $1 -connect $1:443 2> /dev/null | /usr/bin/openssl x509 -text"
alias tf11='docker run -it -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN -e AWS_SESSION_EXPIRES -v ~/.ssh:/root/.ssh --mount type=bind,source=$(pwd),target=/app -w /app dcea4bc1b2bb'
alias tf12='docker run -it -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN -e AWS_SESSION_EXPIRES -v ~/.ssh:~/.ssh --mount type=bind,source=$(pwd),target=/app -w /app a1ff0fcab20d'
alias tf0-13-0='docker run -it -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN -e AWS_SESSION_EXPIRES -v ~/.ssh:/root/.ssh --mount type=bind,source=$(pwd),target=/app -w /app hashicorp/terraform:0.13.0'
alias tf0-14-11='docker run -it -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN -e AWS_SESSION_EXPIRES -v ~/.ssh:/root/.ssh --mount type=bind,source=$(pwd),target=/app -w /app hashicorp/terraform:0.14.11'
alias tf0-14='docker run -it -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN -e AWS_SESSION_EXPIRES -v ~/.ssh:/root/.ssh --mount type=bind,source=$(pwd),target=/app -w /app hashicorp/terraform:0.14.0'
alias tf1='docker run -it -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN -e AWS_SESSION_EXPIRES -v ~/.ssh:/root/.ssh --mount type=bind,source=$(pwd),target=/app -w /app 3ecccf079b62'
alias tf1-0-11='docker run -it -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN -e AWS_SESSION_EXPIRES -v ~/.ssh:/root/.ssh --mount type=bind,source=$(pwd),target=/app -w /app hashicorp/terraform:1.0.11'
alias tf1-1='docker run -it -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN -e AWS_SESSION_EXPIRES -v ~/.ssh:/root/.ssh --mount type=bind,source=$(pwd),target=/app -w /app hashicorp/terraform:1.1.0'
alias tf1-1-2='docker run -it -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN -e AWS_SESSION_EXPIRES -v ~/.ssh:/root/.ssh --mount type=bind,source=$(pwd),target=/app -w /app hashicorp/terraform:1.1.2'
alias tf1-1-7='docker run --platform linux/amd64 -it -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN -e AWS_SESSION_EXPIRES -v ~/.ssh:/root/.ssh --mount type=bind,source=$(pwd),target=/app -w /app hashicorp/terraform:1.1.7'
alias tf1-1-9='docker run --platform linux/amd64 -it -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN -e AWS_SESSION_EXPIRES -v ~/.ssh:/root/.ssh --mount type=bind,source=$(pwd),target=/app -w /app hashicorp/terraform:1.1.9'
alias tf1-2-9='docker run -it -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN -e AWS_SESSION_EXPIRES -v ~/.ssh:/root/.ssh --mount type=bind,source=$(pwd),target=/app -w /app hashicorp/terraform:1.2.9'
alias java11='sdk use java 11.0.2-open'
alias java18='sdk use java 18.0.2-open'

if [ -d $HOME/.aliases ]; then
    if [ -d $HOME/.aliases/awscli ]; then
      for d in $(ls -d $HOME/.aliases/awscli); do
#        source $HOME/.aliases/awscli/$d/*.alias
        source $d/*.alias
      done
      for f in $(find $HOME/.aliases/awscli/. -type f -maxdepth 1 -name "*.alias" -exec ls {} +); do
        source $f
      done
    fi
fi

if [ -f $HOME/.bash_functions ]; then
  source $HOME/.bash_functions
fi

if [ -f $HOME/.osx_alias ]; then
  source $HOME/.osx_alias
fi

if [ -f $HOME/.workrc ]; then
  source $HOME/.workrc
fi

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Created by `pipx` on 2024-02-28 15:34:54
export PATH="$PATH:/Users/jared.bloomer/.local/bin"

eval "$(starship init bash)"
export STARSHIP_CONFIG="~/.config/starship.toml"

