function fontupdate --description 'Update user fonts'
	mkdir -p ~/.local/share/fonts
	pushd ~/.local/share/fonts
	mkfontscale
	mkfontdir
	popd
	fc-cache -fv ~/.local/share/fonts
end
