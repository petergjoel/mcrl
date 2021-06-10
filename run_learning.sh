#!/bin/bash

BUDGET="$1"
if [ -z "$BUDGET" ] ; then
    BUDGET=100
fi

export UPPAAL_EXTERNAL_LEARNER_LIBRARY="$2"
METHOD="-1"
if [ -z "$UPPAAL_EXTERNAL_LEARNER_LIBRARY" ] ; then
    METHOD="4"
fi


if [ -z "$VERIFYTA" ] ; then
    VERIFYTA="verifyta"
fi

SEED=$(od -A n -t d -N 4 /dev/urandom | tr -d ' ')

$VERIFYTA --seed $SEED -u -f output/trace -t1 ./models/mcrl_for_learning.xml -D 0.01 --learning-method $METHOD -s --max-iterations 30 --eval-runs $BUDGET --good-runs $BUDGET --total-runs $BUDGET --reset-no-better 10 --max-reset-learning 3
