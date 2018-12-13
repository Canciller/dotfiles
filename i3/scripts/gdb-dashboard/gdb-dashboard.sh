#!/bin/bash
LAYOUT_FILE="$PWD/gdb.layout.json"
TTY_FILE="$PWD/tty"
DASHBOARD="$PWD/dashboard"

WORKSPACE=$1
TERMINALS=$2
GDB_TERMINALS=$3

USAGE="echo \"usage: $0 workspace non_gdb_terminals gdb_terminals\""

if [ -z "$WORKSPACE" ]; then
    $USAGE
    exit 1
fi

[ -z "$TERMINALS" ] && TERMINALS=1
[ -z "$GDB_TERMINALS" ] && GDB_TERMINALS=5

if [ ! -f "$LAYOUT_FILE" ]; then
    echo "$LAYOUT_FILE doesn't exits."
    exit 1
fi

echo "i3 Layout File: $LAYOUT_FILE"
echo "Dashboard File: $DASHBOARD"
echo "Target Workspace: $WORKSPACE"
echo "Non GDB terminals: $TERMINALS"
echo "GDB terminals: $GDB_TERMINALS"

i3-msg -q "workspace $WORKSPACE; append_layout $LAYOUT_FILE"

echo -n "Spawning non GDB terminals..."
for i in `seq 1 $TERMINALS`
do
    xfce4-terminal
done
echo done

>"$TTY_FILE"

echo -n "Spawning GDB terminals..."
for i in `seq 1 $GDB_TERMINALS`
do
    xfce4-terminal -e "sh -c 'echo \`tty\` >> \"${TTY_FILE}\"; exec zsh'" 
done
echo done

>"$DASHBOARD"

MODULE=("history stack" "assembly source" "threads expressions" "memory" "registers")

echo -n "Creating GDB dashboard..."
if [ -f "$TTY_FILE" ]; then
    I=0
    for t in `cat "$TTY_FILE"`; do
        for m in ${MODULE[$I]};do
            echo "dashboard $m -output $t"  >> "$DASHBOARD"
        done
        I=$((I + 1))
    done
fi
echo done

rm "$TTY_FILE"
