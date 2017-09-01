function ffupdate --description 'Update Firefox in ~/.local'
	set uri "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US"
	set bz2 (curl -sI $uri | grep Location | sed -e 's/Location://' | tr -d '[[:space:]]')
	printf $bz2
	wget -nc --no-check-certificate -P /tmp $bz2
	and tar jxvf /tmp/firefox-*.tar.bz2 -C /tmp
	and rsync -av --delete-after /tmp/firefox ~/.local
end
