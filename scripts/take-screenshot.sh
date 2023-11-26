FILENAME_FORMAT="$HOME/.luna/screenshots/%d_%m_%Y_%H%M%S_screenshot.png"

if [ ! -d "$HOME/.luna/screenshots" ]; then
	mkdir "$HOME/.luna/screenshots"
fi

case $1 in
	"-full")
		scrot -s $FILENAME_FORMAT
		;;
	"-rect")
		scrot -s $FILENAME_FORMAT
		;;
	*)
		echo "Unknown argument: $1"
		;;
esac
