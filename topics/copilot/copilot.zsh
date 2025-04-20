# ------------------------------------------------------------------------------
# - Github Copilot Helpers
# ------------------------------------------------------------------------------

ghcs() {
  FUNCNAME="$funcstack[1]"
  TARGET="shell"
  local GH_DEBUG="$GH_DEBUG"
  local GH_HOST="$GH_HOST"

  local OPT OPTARG OPTIND
  while getopts "dht:-:" OPT; do
    if [ "$OPT" = "-" ]; then     # long option: reformulate OPT and OPTARG
      OPT="${OPTARG%%=*}"       # extract long option name
      OPTARG="${OPTARG#"$OPT"}" # extract long option argument (may be empty)
      OPTARG="${OPTARG#=}"      # if long option argument, remove assigning `=`
    fi

    case "$OPT" in
      debug | d)
        GH_DEBUG=api
        ;;

      help | h)
        echo "$__USAGE"
        return 0
        ;;

      hostname)
        GH_HOST="$OPTARG"
        ;;

      target | t)
        TARGET="$OPTARG"
        ;;
    esac
  done

  # shift so that $@, $1, etc. refer to the non-option arguments
  shift "$((OPTIND-1))"

  TMPFILE="$(mktemp -t gh-copilotXXXXXX)"
  trap 'rm -f "$TMPFILE"' EXIT
  if GH_DEBUG="$GH_DEBUG" GH_HOST="$GH_HOST" gh copilot suggest -t "$TARGET" "$@" --shell-out "$TMPFILE"; then
    if [ -s "$TMPFILE" ]; then
      FIXED_CMD="$(cat $TMPFILE)"
      print -s "$FIXED_CMD"
      echo
      eval "$FIXED_CMD"
    fi
  else
    return 1
  fi
}

ghce() {
  FUNCNAME="$funcstack[1]"
  local GH_DEBUG="$GH_DEBUG"
  local GH_HOST="$GH_HOST"

  local OPT OPTARG OPTIND
  while getopts "dh-:" OPT; do
    if [ "$OPT" = "-" ]; then     # long option: reformulate OPT and OPTARG
      OPT="${OPTARG%%=*}"       # extract long option name
      OPTARG="${OPTARG#"$OPT"}" # extract long option argument (may be empty)
      OPTARG="${OPTARG#=}"      # if long option argument, remove assigning `=`
    fi

    case "$OPT" in
      debug | d)
        GH_DEBUG=api
        ;;

      help | h)
        echo "$__USAGE"
        return 0
        ;;

      hostname)
        GH_HOST="$OPTARG"
        ;;
    esac
  done

  # shift so that $@, $1, etc. refer to the non-option arguments
  shift "$((OPTIND-1))"

  GH_DEBUG="$GH_DEBUG" GH_HOST="$GH_HOST" gh copilot explain "$@"
}
