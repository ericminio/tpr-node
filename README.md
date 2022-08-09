## TTT

- TDD: Test-Driven Development
- TCR: test && commit || revert
- TPR: tcr && push || rebase

### Rules of the game

- red test is forbidden -> expect reset on red test
- conflict is forbidden -> expect reset HEAD~1 && pull on conflict

### Usage

```
export TTT_FOLDER=/Users/eric/dev/katas/prime-factors
export TTT_REPO=/Users/eric/dev/katas

./watch.sh
```