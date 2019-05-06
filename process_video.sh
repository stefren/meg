#!/bin/bash

ffmpeg -i $1 -vf scale=640:480 temp.mp4
ffmpeg -i temp.mp4 -vf pad=1280:960:320:240 temp2.mp4
ffmpeg -i temp2.mp4 -vf perspective=200:200:1080:200:0:960:1280:960:sense=1 temp3.mp4
ffmpeg -i temp3.mp4 -vf scale=640:480 temp4.mp4
ffmpeg -i temp4.mp4 -vf hflip -c:a copy final_output.mp4
rm temp*.mp4
scp final_output.mp4 debian@beaglebone.local:~/video/
