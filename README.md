## TTT

- TDD: Test-Driven Development
- TCR: test && commit || revert
- TPR: tcr && push || rebase

### Rules of the game

- red test is forbidden -> `git reset --hard HEAD` on red test
- conflict is forbidden -> `git reset --hard HEAD~1 && git pull` on rebase conflict

### Usage

```
export TTT_FOLDER=/Users/eric/dev/katas/prime-factors
export TTT_REPO=/Users/eric/dev/katas
export TTT_RUN=(TDD | TCR | TPR)

./watch.sh
```

update your `.gitignore` with
```
.tpr-checksum
```