#!/bin/sh
vi -c "%g/som.kthcorp.com/d" -c "wq" $HOME/.ssh/known_hosts
ssh -l 20110012 -p 10201 som.kthcorp.com
exit 0
