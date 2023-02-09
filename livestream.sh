#!/bin/bash
ffmpeg -re -f concat -i /[PATH-TO-PLAYLIST-FILE] -codec copy -flvflags no_duration_filesize -f flv rtmp://[YOUR_LINKE]/[YOUR_KEY]
