#!/bin/bash

toMinutes () {
    local TIME="$1"
    local TIME_H=$(echo $TIME | cut -d ":" -f 1)
    local TIME_M=$(echo $TIME | cut -d ":" -f 2)
    echo "$TIME_H * 60 + $TIME_M" | bc
}

WT_BEGIN="$1"
WT_BREAK="$2"

WT_BEGIN_MIN=$(toMinutes $WT_BEGIN)
WT_BREAK_MIN=$(toMinutes $WT_BREAK)
WT_DEBT_MIN=$(toMinutes "7:48")


echo $WT_BEGIN_MIN
echo $WT_BREAK_MIN
echo $WT_DEBT_MIN
