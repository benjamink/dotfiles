alias gbpurge='nocorrect git branch --merged | grep -Ev "(\*|master|develop|staging)" | xargs -n 1 git branch -d'

