alias gbpurge='nocorrect git branch --merged | grep -Ev "(\*|master|develop|staging)" | xargs -n 1 git branch -d'

tickets_in_tag () {
  PREV_TAG=$1
  OUTPUT=$2

  if [[ -n $PREV_TAG ]]
  then
    case $OUTPUT in
      long|verbose)
        git log --oneline $PREV_TAG..HEAD
        ;;
      *)
        git log --oneline $PREV_TAG..HEAD | awk -F'[ |:]' '{print $2}' | sort | uniq
        ;;
    esac
  else
    echo "Error: Missing tag"
  fi
}
