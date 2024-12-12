sudo -n $1
output=$?
echo "BBBBBBBBBBBBBBBBBBBBBB"
if  [ ${output} = 1 ]; then
	echo $(zenity --password --title="Enter sudo password") | sudo -S $1
	echo "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
else
	exit 0
fi
exit 0
