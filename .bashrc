PATH=$PATH:$HOME/bin
eval "$(/opt/homebrew/bin/brew shellenv)"
export HISTTIMEFORMAT="%m/%d/%y %T "
export HISTFILESIZE=
export HISTSIZE=
export TFENV_ARCH=amd64 #Require for Terraform on m1 macbooks
export CAI_ARTIFACTORY_USER=''
export JAVA_HOME='/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home/'
export AWS_DEFAULT_REGION='us-east-1'

gitup ()
{
    if [ -z $1 ]; then
        echo 'usage: [production,pre,dev,qa,qb]';
        exit 1;
    fi;
    echo "Checking out repo: $1.";
    echo;
    echo;
    git checkout $1;
    echo;
    echo;
    echo "Pulling new version of $1.";
    echo;
    echo;
    git pull upstream $1;
    echo;
    echo;
    echo "Pushing updated version to origin.";
    echo;
    echo;
    git push origin $1;
    echo;
    echo;
    git status
}

gitconfig ()
{
	read -p "Enter the Git URL for the Origin: " GITORIGIN
	git remote add origin $GITORIGIN
	unset GITORIGIN
	
	read -p "Enter the Git URL for the Remote Upstream: " GITREMOTE
	git remote add upstream $GITREMOTE
	unset GITREMOTE

	git config --add remote.origin.push '+refs/heads/*:refs/heads/*'
	git config --add remote.origin.push '+refs/tags/*:refs/tags/*'
	git config --add remote.origin.fetch '+refs/heads/*:refs/remotes/upstream/*'

}

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

usersearch() {
	echo -n "Enter your LDAP (Network) Username: "
	read LDAPUSER
	echo -n "Enter the Firstname of the user to search for: "
	read FUSER
	echo -n "Enter the Last name of the user to search for: "
	read LUSER
	LDAPHOST="0.0.0.0"
	BINDDN="CN=$LDAPUSER"',OU=Users,DC=example,DC=com'
	BASEDN='OU=Users,DC=example,DC=com'
	SEARCHSTRING="(&(sn=$LUSER)(givenName=$FUSER))"
    LDAPOPTS="-x -h $(echo $LDAPHOST) -D $(echo $BINDDN) -b $(echo $BASEDN) -W \"$(echo $SEARCHSTRING)\""
    set -x
    /usr/bin/ldapsearch $LDAPOPTS
    set +x
	#/usr/bin/ldapsearch -x -h $LDAPHOST -D "'$BINDDN'" -b "'$BASEDN'" -W \"$SEARCHSTRING\"
    # ldapsearch -x -h 0.0.0.0 -D 'CN=username,OU=Users,DC=example,DC=com' -b 'OU=Users,DC=example,DC=com' -W  "(&(sn=LastName)(givenName=FirstName))" | grep 'memberOf' | cut -d'=' -f2 | cut -d',' -f1
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

function export_alks() {
  if [ $# -lt 2 ]; then
      echo "Please pass both account alias & role you want to use"
      echo " export_alks AccountAlias Role"
      return 1
  fi

  eval $(alks sessions open -i -a "$1" -r "$2")
}

function cais_accounts {
    cat ~/.aws_accounts | xargs -I {} sh -c 'org=CAIS-Accounts && repo={} && pr_count=$(gh api repos/$org/$repo/pulls?state=open | jq length) && status=$(gh api repos/$org/$repo/commits/master/status | jq -r .state) && echo "$org/$repo\t$status\t$pr_count"' | awk -F'\t' '{if($2=="success") {printf "%-35s\033[32m%s\033[0m | %-9s\n", $1, $2, $3} else if($2=="pending") {printf "\033[33m%-35s%s\033[0m | %-9s\n", $1, $2, $3} else {printf "\033[31m%-35s%s\033[0m | %-9s\n", $1, $2, $3}}' | column -t -s '   ' | sed 's/\t/ | /g'
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
alias admin-scripts="cd /Users/jared.bloomer/admin-scripts && source venv/bin/activate"
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
alias alksp='alks profile generate -A'

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

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Created by `pipx` on 2024-02-28 15:34:54
export PATH="$PATH:/Users/jared.bloomer/.local/bin"

eval "$(starship init bash)"
export STARSHIP_CONFIG="~/.config/starship.toml"

