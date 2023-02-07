#!/bin/bash

toMinutes () {
    local TIME="$1"
    local TIME_H=$(echo $TIME | cut -d ":" -f 1)
    local TIME_M=$(echo $TIME | cut -d ":" -f 2)
    echo "$TIME_H * 60 + $TIME_M" | bc
}



WT_BEGIN="$1"
WT_BREAK="$2"
WT_DEBT="$3"
[[ -z $WT_DEBT ]] && WT_DEBT="7:38"

WT_BEGIN_MIN=$(toMinutes $WT_BEGIN)
WT_BREAK_MIN=$(toMinutes $WT_BREAK)
WT_DEBT_MIN=$(toMinutes $WT_DEBT)
WT_CUR_MIN=$(toMinutes `date +"%H:%M"`)

#echo $WT_BEGIN_MIN
#echo $WT_BREAK_MIN
#echo $WT_DEBT_MIN
#echo $WT_CUR_MIN
echo "$WT_DEBT_MIN - ($WT_CUR_MIN - $WT_BEGIN_MIN) + $WT_BREAK_MIN" | bc
