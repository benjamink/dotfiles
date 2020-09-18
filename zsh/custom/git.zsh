tickets_in_tag () {
    PREV_TAG=$1
    OUTPUT=$2
    if [[ -n $PREV_TAG ]]
    then
        case $OUTPUT in
            (long | verbose) git log --oneline $PREV_TAG..HEAD ;;
            (jira) (
                    echo "||Date||Author||Summary||"
                    git log --oneline $PREV_TAG..HEAD --date=short --format="|%ad|%aN|%s|" 2>&1 | sed -E "s/(#[^)]([0-9]+))/PR: [\1|https:\/\/github.ibm.com\/maas360-gts\/puppet-common\/pull\/\1]/g"
                ) | tee >(pbcopy) ;;
            (*) git log --oneline $PREV_TAG..HEAD | awk -F'[ |:]' '{print $2}' | sort | uniq ;;
        esac
    else
        echo "Error: Missing tag"
    fi
}
