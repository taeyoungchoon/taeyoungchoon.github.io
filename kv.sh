#!/usr/bin/env bash

a='b c'
d='e f'
col='a d'

for i in ${col[@]}; do
    echo key : ${i}
    echo values : ${!i}
done

