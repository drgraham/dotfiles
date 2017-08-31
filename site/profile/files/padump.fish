function padump --description 'Record active PA audio stream'
	if not test -e $argv[1]
		set source (pactl list short sources | cut -f 2 | grep analog-stereo.monitor)
		parec -d $source | sox -t raw -r 44100 -e signed-integer -L -b 16 -c 2 - -t wav $argv[1]
	end
end
