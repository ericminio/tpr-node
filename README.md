## TTT

- TDD: Test-Driven Development
- TCR: test && commit || revert
- TPR: tcr && push || rebase

### Rules of the game

- red test is forbidden -> `git reset --hard HEAD` on red test
- conflict is forbidden -> `git reset --hard HEAD~1 && git pull` on rebase conflict

### Usage

update your `.gitignore` with
```
.tpr-*
```

```
export TTT_FOLDER=/Users/eric/dev/katas/prime-factors
export TTT_REPO=/Users/eric/dev/katas
export TTT_RUN=(TDD | TCR | TPR)

cd dist
./watch.sh
```

### Tip

update your shell start script
```
function ttt {
    export TTT_REPO=$(pwd)
    export TTT_FOLDER=$(pwd)/$1
    export TTT_RUN=$2
    env | grep TTT

    cd ~/dev/tpr/dist
}
```