#!/usr/bin/sh

spotify_pid=$(pidof spotify)

if [ "$spotify_pid" = "" ]; then
	echo "<action=\`exec spotify-launcher\`>No music is playing</action>"
	exit
fi

playerctl -p spotify metadata --format "{{ artist }} - {{ trunc(title, 20) }} ({{ duration(position) }}/{{ duration(mpris:length) }})"
