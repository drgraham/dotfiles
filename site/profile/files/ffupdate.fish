function ffupdate --description 'Update Firefox in ~/.local'
	set uri "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US"
	set bz2 (curl -sI $uri | grep Location | sed -e 's/Location://' | tr -d '[[:space:]]')
	printf $bz2
	wget -nc --no-check-certificate -P /tmp $bz2
	and tar jxvf /tmp/firefox-*.tar.bz2 -C /tmp
	and rsync -av --delete-after /tmp/firefox ~/.local
	pushd ~/.local/share/applications/
	cp firefox.stub firefox.desktop
	printf "Exec=$HOME/.local/firefox/firefox %%u\n" >> firefox.desktop
	printf "Icon=$HOME/.local/firefox/browser/icons/mozicon128.png\n" >> firefox.desktop
	popd
	xdg-desktop-menu forceupdate
end
