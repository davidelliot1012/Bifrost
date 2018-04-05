#########################
#     Bifrost - TUO     #
#     Version 0.125     #
#        Amn173         #
#       04/02/18        #
#########################
clear

if [[ $1 =~ ^.*youtu.*$ ]]; then
	echo "Entering URL into Youtube-dl"
	echo "URL: ${1}"
	echo ""
	echo $'(V)ideo, (A)udio, (E)xit'
	read -p "~>" -n 1 -r

	if [[ $REPLY =~ ^[Aa]$ ]]; then
		echo 'Downloading audio file...'
		youtube-dl -f 'bestaudio' -o '/data/data/com.termux/files/home/storage/music/youtube-dl/%(title)s.f%(format_id)s.%(ext)s' $1

	elif [[ $REPLY =~ ^[Vv]$ ]]; then
		echo 'Downloading video file...'
		youtube-dl -o "/data/data/com.termux/files/home/storage/movies/youtube-dl/%(title)s.%(ext)s" -f "best[height<=480]" $1

	else
		echo "Exiting..."
	fi

elif [[ $1 =~ ^.*nourlselected.*$ ]]; then
	echo "ERROR1"

else
	echo "Unhandled URL type: $1"
fi







