# Script Collection for the git cmd interface

A collection of various helpful git cmd line extensions.
Runs on Windows (.cmd)

## Description

#### git-logg

This will display you a pretty log of the last 40 commits

```
git logg
```

#### git-pushh

This will automatically detect your current branch and push the repo to the remote(s).
In case you specify a remote, it will push only there.
```
git pushh BRANCH
```

In case you have multiple remotes and don't specify one, it will push to all of them but ask you for confirmation for each.
In case you have only one remote, it will push to this single remote without confirmation.
The timeout for the confirmations is set to 5 sec. After that, the script will push the content.
```
git pushh
```

#### git-committ

This will call
```
git add ./
git commit -m MESSAGE
git pushh
git logg
```

MESSAGE is what you provide as parameters when calling this command. You don't need to quote your commit message:

```
git committ This is simply your commit message
```

#### git-mergee

This will basically call
```
git fetch . BRANCH_A:BRANCH_B
git checkout BRANCH_B
```

It can automatically detect your current branch, for getting the same result as above, you can simply call:

```
git mergee BRANCH_B
```

Besides you can specify BRANCH_A manually by calling:
```
git mergee BRANCH_A BRANCH_B
```

---

## Registering the scripts

You can clone this repository in any folder on you computer.

Afterwards, you can either register all scripts at once (recommended as they have cross-dependencies) or register each script on it's own.

#### Let a script do all the stuff

<!-- Warning: This will register all files matching the following regex: git-*.cmd as new git commands. This is normally safe but provides a leak of security.

Simply run

```
.\register.cmd
```

If that doesn't work, use the alternate register script. -->

Simply execute:

```
.\register_alt.cmd
```

This simply executes the following command lines for each git command

#### Register the files the long way

Call for each script:

```
git config --global alias.NEWCOMMAND "!C:\\PROGRA~1\\Git\\cmd\\git-NEWCOMMAND.cmd"
```

## TO-SSH Script

Credits go [here](https://gist.github.com/icyflame/532edee5422baeabac56d111f642bd73)

quick and dirty conversion for handling gitlab and github remotes.. needs improvement