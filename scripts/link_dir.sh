DIRECTORY=$1
LINK=$2

[ -z "$DIRECTORY" -o -z "$LINK" ] && exit 1
[ -d "$DIRECTORY" -a -d "$LINK" ] || exit 1

DIRECTORY="$(realpath "$DIRECTORY")"
LINK="$(realpath "$LINK")"

mkdir -p "$LINK"

for FILE in "$DIRECTORY"/* ;do
  NAME="$(basename "$FILE")"
  case "$FILE" in
    *.ignore);;
    *)
      ./scripts/link.sh "$FILE" "$LINK/$NAME"
    ;;
  esac
done