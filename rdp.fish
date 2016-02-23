function rdp --description 'Preconfigured xfreerdp connection'
	xfreerdp -g 1024x768 -K -x l -z --no-auth --ignore-certificate --sec tls --plugin cliprdr $argv[1]
end
