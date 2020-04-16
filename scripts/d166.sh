#/bin/bash
SESSION_NAME="pps"
if [ $# -eq 1 ]; then 
    SESSION_NAME=$1
fi
    
ssh YOURNAME@10.8.163.166 -t "tmux a -d -t $SESSION_NAME"
