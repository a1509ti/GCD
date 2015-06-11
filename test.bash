#!/bin/bash

tmp=/tmp/$$

ERROR_EXIT () {
    echo "$1" >&2
    rm -f $tmp-*
    exit 1
}

##############################
# TEST1
##############################

echo 4 > $tmp-ans
./15745109 12 20 > $tmp-out
diff $tmp-ans $tmp-out || ERROR_EXIT "TEST1-1"

echo 5 > $tmp-ans
./15745109 15 25 > $tmp-out
diff $tmp-ans $tmp-out || ERROR_EXIT "TEST1-2"

echo 12 > $tmp-ans
./15745109 24 36 > $tmp-out
diff $tmp-ans $tmp-out || ERROR_EXIT "TEST1-3"

##############################
# TEST2
##############################

./15745109 10 100 || ERROR_EXIT "TEST2"

##############################
# TEST3
##############################

./15745109 10 && ERROR_EXIT "TEST3-1"
./15745109 12 24 54 && ERROR_EXIT "TEST3-2"
./15745109 tmp1 tmp2 && ERROR_EXIT "TEST3-3"

echo OK
rm -f $tmp-*
exit 0
