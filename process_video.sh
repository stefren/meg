#!/bin/bash

ffmpeg -i $1 -vf scale=640:480 temp.mp4
ffmpeg -i temp.mp4 -vf pad=1280:960:320:240 temp2.mp4
ffmpeg -i temp2.mp4 -vf perspective=200:100:1000:100:0:960:1200:960:sense=1 temp3.mp4
ffmpeg -i temp3.mp4 -vf scale=640:480 final_output.mp4

