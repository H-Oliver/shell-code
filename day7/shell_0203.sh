#!/bin/bash
cd /oldboy
ls |awk -F [-.] '{print "mv " $0,"linux-"$2,".HTML"}'
