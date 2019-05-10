# Script Collection for the git cmd interface

A collection of various helpfully git cmd line extensions.
A more detailed description follows soon

## Description

#### git-logg

This will display you a pretty log of the last 40 commits

```
git logg
```

#### git-pushh

This will automatically detect your current branch and push the repo to the remote(s).
In case you specify a remote, it will push only there.
In case you have multiple remotes and don't specify one, it will push to all of them but ask you for confirmation for each.
In case you have only one remote, it will push to this single remote without confirmation

```
git pushh BRANCH
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

---

## Registering the scripts

For using the scripts, it's required that you clone this repo into your local Git installation folder (usually C:\Program Files\Git) and there inside the cmd folder:
```
cd PATHTOYOURGITINSTALLATIONFOLDER/cmd/
git clone https://gitlab.com/stroblme/gitutils ./
```

Now you can either register all scripts at once (recommended as they have cross-dependencies) or register each script on it's own.

#### Let a script do all the stuff

Warning: This will register all files matching the following regex: git-*.cmd as new git commands. This is normally safe but provides a leak of security.

Simply run

```
.\register.cmd
```

#### Register the files the long way

Call for each script:

```
git config --global alias.NEWCOMMAND "!C:\\PROGRA~1\\Git\\cmd\\git-NEWCOMMAND.cmd"
```

