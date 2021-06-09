#/bin/bash
#-- Script to automatically convert all git remotes to SSH from HTTPS
# Script will change all the git remotes.
# If you didn't intend to do that, run the other script in this repo.
# Original 1: https://gist.gitlab.com/m14t/3056747
# Original 2: https://gist.gitlab.com/chuckbjones/9dc6634fe52e56ba45ac
# Thanks to @m14t, @michaelsilver and @chuckbjones.

http_to_ssh_gitlab(){
    echo ""
    echo "Checking for $1..."

    REPO_URL=`git remote -v | grep -m1 "^$1" | sed -Ene's#.*(https://[^[:space:]]*).*#\1#p'`
    if [ -z "$REPO_URL" ]; then
	if [ "$1" == "upstream" ]; then
	    echo "-- No upstream found"
	    return
	else
	    echo "-- ERROR:  Could not identify Repo url."
	    echo "   It is possible this repo is already using SSH instead of HTTPS."
	    return
	fi
    fi

    USER=`echo $REPO_URL | sed -Ene's#https://gitlab.com/([^/]*)/(.*)#\1#p'`
    if [ -z "$USER" ]; then
	echo "-- ERROR:  Could not identify User."
	return
    fi

    REPO=`echo $REPO_URL | sed -Ene's#https://gitlab.com/([^/]*)/(.*)#\2#p'`
    if [ -z "$REPO" ]; then
	echo "-- ERROR:  Could not identify Repo."
	return
    fi

    NEW_URL="git@gitlab.com:$USER/$REPO.git"
    echo "Changing repo url from "
    echo "  '$REPO_URL'"
    echo "      to "
    echo "  '$NEW_URL'"
    echo ""

    CHANGE_CMD="git remote set-url $1 $NEW_URL"
    echo "$CHANGE_CMD"
    `$CHANGE_CMD`
}

http_to_ssh_github(){
    echo ""
    echo "Checking for $1..."

    REPO_URL=`git remote -v | grep -m1 "^$1" | sed -Ene's#.*(https://[^[:space:]]*).*#\1#p'`
    if [ -z "$REPO_URL" ]; then
	if [ "$1" == "upstream" ]; then
	    echo "-- No upstream found"
	    return
	else
	    echo "-- ERROR:  Could not identify Repo url."
	    echo "   It is possible this repo is already using SSH instead of HTTPS."
	    return
	fi
    fi

    USER=`echo $REPO_URL | sed -Ene's#https://github.com/([^/]*)/(.*)#\1#p'`
    if [ -z "$USER" ]; then
	echo "-- ERROR:  Could not identify User."
	return
    fi

    REPO=`echo $REPO_URL | sed -Ene's#https://github.com/([^/]*)/(.*)#\2#p'`
    if [ -z "$REPO" ]; then
	echo "-- ERROR:  Could not identify Repo."
	return
    fi

    NEW_URL="git@github.com:$USER/$REPO.git"
    echo "Changing repo url from "
    echo "  '$REPO_URL'"
    echo "      to "
    echo "  '$NEW_URL'"
    echo ""

    CHANGE_CMD="git remote set-url $1 $NEW_URL"
    echo "$CHANGE_CMD"
    `$CHANGE_CMD`
}

for i in `git remote`; do
	http_to_ssh_github "$i"
	http_to_ssh_gitlab "$i"

done;

echo "Moved everything to SSH!"
