#!/bin/sh
vi -c "%g/som.yourdomain.com/d" -c "wq" $HOME/.ssh/known_hosts
ssh -l [username] -p [port] [url]
exit 0
