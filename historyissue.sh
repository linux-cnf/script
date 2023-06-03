#!/bin/bash
#purpose: History command is disabled by default on bash script, that's why even history command won't work in .sh file. for its redirection. Kindly redirect bash_history file inside the .sh file.
#purpose_again: History mechanism can be enabled also by mentioning history file and change run-time parameters as mentioned below
#author: Bablish Jaiswal
HISTFILE=~/.bash_history
set -o history
