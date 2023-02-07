#!/bin/bash

toMinutes () {
    local TIME="$1"
    local TIME_H=$(echo $TIME | cut -d ":" -f 1)
    local TIME_M=$(echo $TIME | cut -d ":" -f 2)
    echo "$TIME_H * 60 + $TIME_M" | bc
}

toTime () {
    local MINS="$1"
    [[ "${MINS::1}" == "-" ]] && MINS=${MINS:1} && NEG="-"
    local TIME_H=$(echo "$MINS / 60" | bc)
    local TIME_M=$(echo "$MINS - $TIME_H*60" | bc)
    echo "${NEG}${TIME_H}:${TIME_M}"
}

WT_BEGIN="$1"
WT_BREAK="$2"
WT_DEBT="$3"
[[ -z $WT_DEBT ]] && WT_DEBT="7:38"

WT_BEGIN_MIN=$(toMinutes $WT_BEGIN)
WT_BREAK_MIN=$(toMinutes $WT_BREAK)
WT_DEBT_MIN=$(toMinutes $WT_DEBT)
WT_CUR_MIN=$(toMinutes `date +"%H:%M"`)

WT_LEFT_MIN=$(echo "$WT_DEBT_MIN - ($WT_CUR_MIN - $WT_BEGIN_MIN) + $WT_BREAK_MIN" | bc)
toTime $WT_LEFT_MIN
