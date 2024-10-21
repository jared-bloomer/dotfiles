# Open an ALKS sessions
function as() {

  ACCOUNT=${1:-'myawsaccount'} # Use $1 for value or default to 'myawsaccount'
  ROLE=${2:-'Admin'} # Use $2 for value or default to 'Admin'

  echo "ACCOUNT: $ACCOUNT"
  echo "ROLE: $ROLE"

  # Collect Network Password
  read -p "Network Password?" -s -r ALKS_PASS
  echo 

  # Open ALKS session
  alks sessions open --password "$ALKS_PASS" -a "$ACCOUNT" -r "$ROLE" -o aws 

  # Unset network Passord Variable
  unset ALKS_PASS
}

