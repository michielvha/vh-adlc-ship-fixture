#!/bin/sh
# Checks the greeting for a name and for no argument.
check() { [ "$1" = "$2" ] || { echo "FAIL: got $1, want $2"; exit 1; }; }
check "$(./greet.sh Ada)" "Hello, Ada."
check "$(./greet.sh Grace)" "Hello, Grace."
check "$(./greet.sh)" "Hello, world."
echo PASS
