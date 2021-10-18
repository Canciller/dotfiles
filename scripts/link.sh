# TODO: Check if link directory exists.

TARGET=$1
LINK=$2

[ -z "$TARGET" -o -z "$LINK" ] && exit 1

TARGET="$(realpath "$TARGET")"
LINK="$(realpath -s "$LINK")"

[ -d "$(dirname "$LINK")" ] || exit 1

BACKUP=false
IGNORE=false

if [ -L "$LINK" ]; then
  OLD_TARGET="$(readlink -f "$LINK")"
  if [ "$TARGET" = "$OLD_TARGET" ]; then
    IGNORE=true
  else
    BACKUP=true
  fi
elif [ -e "$LINK" ]; then
  BACKUP=true
fi

if $BACKUP; then
  echo -en "\e[33m"
  echo ln --backup=numbered -sbv "$TARGET" "$LINK"
elif $IGNORE; then
  echo Ignoring $TARGET
else
  echo -en "\e[32m"
  echo ln -sv "$TARGET" "$LINK"
fi

echo -en "\e[39m"