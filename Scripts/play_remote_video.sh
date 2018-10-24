#!/bin/bash
###
# This is a simple script to play video across ssh with VLC
###

if [[ -z $3 ]]; then
echo "Usage: play_remote_video.sh [username] [remote_address] [video_full_path]"
exit 1
fi

ssh $1@$2 "cat $3" | vlc -