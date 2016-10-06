all: dirs fish programs fonts rc gnomeconf

dirs:
	mkdir -p $(HOME)/.config/fish/functions
	mkdir -p $(HOME)/.config/xfce4/terminal
	mkdir -p $(HOME)/.local/bin
	mkdir -p $(HOME)/.local/share/applications
	mkdir -p $(HOME)/.fonts
	mkdir -p $(HOME)/Pictures
	mkdir -P $(HOME)/GDrive

fish:
	cp config.fish $(HOME)/.config/fish/
	cp ffupdate.fish $(HOME)/.config/fish/functions/
	cp fontupdate.fish $(HOME)/.config/fish/functions/
	cp padump.fish $(HOME)/.config/fish/functions/

programs:
	cp frun $(HOME)/.local/bin/
	wget -nc -P $(HOME)/.local/bin https://yt-dl.org/downloads/latest/youtube-dl
	chmod 755 $(HOME)/.local/bin/youtube-dl
	cp firefox.stub $(HOME)/.local/share/applications/
	fish -c "ffupdate"
	fish -c "go get -v -u github.com/odeke-em/drive/cmd/drive"
	git clone https://github.com/drgraham/crosspoint.git /tmp/crosspoint
	$(MAKE) -C /tmp/crosspoint

fonts:
	# http://www.blambot.com/font_backissues.shtml
	wget -nc -P /tmp http://www.blambot.com/_fonts/backissuesbb_tt.zip
	# http://www.dafont.com/komika-title.font
	wget http://dl.dafont.com/dl/?f=komika_title -O /tmp/komika_title.zip
	# http://www.dafont.com/yikes.font
	wget http://dl.dafont.com/dl/?f=yikes -O /tmp/yikes.zip
	# http://www.impallari.com/projects/update/85
	wget -nc -P /tmp http://www.impallari.com/media/uploads/prosources/update-85-source.zip
	unzip -o /tmp/backissuesbb_tt.zip -d /tmp
	unzip -o /tmp/komika_title.zip -d /tmp
	unzip -o /tmp/yikes.zip -d /tmp
	unzip -o /tmp/update-85-source.zip -d /tmp
	cp /tmp/*.ttf $(HOME)/.fonts/
	cp /tmp/*.TTF $(HOME)/.fonts/
	cp /tmp/Domine-v1.0/*.ttf $(HOME)/.fonts/
	fish -c "fontupdate"

rc:
	cp vimrc $(HOME)/.vimrc
	cp terminalrc $(HOME)/.config/xfce4/terminal/

gnomeconf:
	wget -nc -P $(HOME)/Pictures http://photojournal.jpl.nasa.gov/tiff/PIA02991.tif
	convert $(HOME)/Pictures/PIA02991.tif $(HOME)/Pictures/PIA02991.png
	dconf write /org/gnome/desktop/background/picture-uri "'file://"$(HOME)"/Pictures/PIA02991.png'"
	dconf write /org/gnome/desktop/background/picture-options "'zoom'"
	dconf write /org/gnome/desktop/wm/preferences/focus-mode "'sloppy'"
	dconf write /org/gnome/shell/favorite-apps "['org.gnome.Nautilus.desktop', 'xfce4-terminal.desktop', 'firefox.desktop', 'google-chrome.desktop', 'mousepad.desktop', 'keepassx2.desktop']"
	dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
	dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'terminal'"
	dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command "'xfce4-terminal --drop-down'"
	dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'F12'"
	dconf write /org/gnome/system/location/enabled "false"
	dconf write /org/gnome/desktop/privacy/old-files-age "uint32 1"
	dconf write /org/gnome/desktop/privacy/remove-old-temp-files "true"
	dconf write /org/gnome/desktop/privacy/remove-old-trash-files "false"
	dconf write /org/gnome/desktop/privacy/report-technical-problems "false"
	dconf write /org/gnome/desktop/privacy/send-software-usage-stats "false"
	dconf write /org/gnome/desktop/input-sources/xkb-options "['compose:ralt']"
	dconf write /org/gnome/software/download-updates "false"
