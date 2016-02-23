function fontupdate --description 'Update user fonts'
	mkdir -p ~/.fonts
	pushd ~/.fonts
	mkfontscale
	mkfontdir
	popd
	fc-cache -fv ~/.fonts
end
