# youtube-live-radio

Simple script to stream videos continuously to a platform of your choice (YT, Twitch, ...)

<h1>Quickstart</h1>

<code>apt install ffmpeg -y </code>

Change directory

<code>cd stream</code>

Install Playlist.txt file in a path of your choice

<code>sudo nano playlist.txt</code>

should look somewhat like this:

```
file 'video1.mp4'
file 'video2.mp4'
file 'video3.mp4'
file 'video4.mp4'
```

create a start script

<code>sudo nano /start.sh</code>

should look something like this:

```
#!/bin/bash
ffmpeg -re -f concat -i [PATH]/stream/playlist.txt -codec copy -flvflags no_duration_filesize -f flv rtmp://[YOUR_LINKE]/[YOUR_KEY]
```

create a systemctl service
<code>sudo nano /etc/systemd/system/stream.service</code>

should look something like this:

```
[Unit]
Description=Stream
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=1
User=[username]
ExecStart= [PATH]/start.sh

[Install]
WantedBy=multi-user.target
```

<code>sudo systemctl start stream</code>

<code>sudo systemctl enable stream</code>

Done!
