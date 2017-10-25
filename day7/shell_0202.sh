#!/bin/bash
cd /oldboy
for n in `seq 10`
do
  mv oldboy-${n}.html linux-${n}.HTML
done
