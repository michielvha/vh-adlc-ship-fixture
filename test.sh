#!/bin/sh
# The deliberate failing test: greet.sh does not take a name yet.
check() { [ "$1" = "$2" ] || { echo "FAIL: got $1, want $2"; exit 1; }; }
check "$(./greet.sh Ada)" "Hello, Ada."
check "$(./greet.sh Grace)" "Hello, Grace."
check "$(./greet.sh)" "Hello, world."
echo PASS
