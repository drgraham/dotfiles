all: dirs fish programs fonts rc

dirs:
	mkdir -p $(HOME)/.config/fish/functions
	mkdir -p $(HOME)/.config/autostart
	mkdir -p $(HOME)/.config/xfce4/terminal
	mkdir -p $(HOME)/.local/bin
	mkdir -p $(HOME)/.local/share/applications
	mkdir -p $(HOME)/.fonts
	mkdir -p $(HOME)/.themes
	mkdir -p $(HOME)/Pictures
	mkdir -p $(HOME)/GDrive

fish:
	cp config.fish $(HOME)/.config/fish/
	cp ffupdate.fish $(HOME)/.config/fish/functions/
	cp fixctrl.fish $(HOME)/.config/fish/functions/
	cp fontupdate.fish $(HOME)/.config/fish/functions/
	cp padump.fish $(HOME)/.config/fish/functions/
	cp rdp.fish $(HOME)/.config/fish/functions/

programs:
	cp frun $(HOME)/.local/bin/
	wget -nc -P $(HOME)/.local/bin https://yt-dl.org/downloads/latest/youtube-dl
	chmod 755 $(HOME)/.local/bin/youtube-dl
	wget -nc -P /tmp http://iweb.dl.sourceforge.net/project/apngasm/2.9/apngasm_gui-2.9-bin-win32.zip
	unzip -f /tmp/apngasm_gui-2.9-bin-win32.zip -d /tmp
	cp /tmp/apngasm_gui.exe $(HOME)/.local/bin/
	cp firefox.stub $(HOME)/.local/share/applications/
	fish -c "ffupdate"
	fish -c "go get -v -u github.com/odeke-em/drive/cmd/drive"
	git clone https://github.com/drgraham/crosspoint.git /tmp/crosspoint
	$(MAKE) -C /tmp/crosspoint

fonts:
	# http://www.blambot.com/font_backissues.shtml
	wget -nc -P /tmp http://www.blambot.com/fonts/backissuesbb_tt.zip
	# http://www.dafont.com/komika-title.font
	wget http://dl.dafont.com/dl/?f=komika_title -O /tmp/komika_title.zip
	# http://www.dafont.com/yikes.font
	wget http://dl.dafont.com/dl/?f=yikes -O /tmp/yikes.zip
	# http://www.impallari.com/projects/update/85
	wget -nc -P /tmp http://www.impallari.com/media/uploads/prosources/update-85-source.zip
	unzip -f /tmp/backissuesbb_tt.zip -d /tmp
	unzip -f /tmp/komika_title.zip -d /tmp
	unzip -f /tmp/yikes.zip -d /tmp
	unzip -f /tmp/update-85-source.zip -d /tmp
	cp /tmp/*.ttf $(HOME)/.fonts/
	cp /tmp/*.TTF $(HOME)/.fonts/
	cp /tmp/Domine-v1.0/*.ttf $(HOME)/.fonts/
	fish -c "fontupdate"

rc:
	cp vimrc $(HOME)/.vimrc
	cp XCompose $(HOME)/.XCompose
	cp terminalrc $(HOME)/.config/xfce4/terminal/

lxqtconf:
	cp dmrc $(HOME)/.dmrc
	#cp fixctrl.desktop $(HOME)/.config/autostart/
	wget -nc -P $(HOME)/Pictures http://photojournal.jpl.nasa.gov/tiff/PIA02991.tif
	convert $(HOME)/Pictures/PIA02991.tif $(HOME)/Pictures/PIA02991.png
	# http://box-look.org/content/show.php?action=content&content=167604
	# http://phobi4n.deviantart.com/art/Mistral-Openbox-543910044
	wget -nc -P /tmp http://orig01.deviantart.net/2870/f/2015/184/6/8/mistral_openbox_by_phobi4n-d8ztvoc.7z
	7z x -y -o$(HOME)/.themes /tmp/mistral_openbox_by_phobi4n-d8ztvoc.7z
	sed -i -e '6s/2/0/' -e '43s/^/\!# /' $(HOME)/.themes/Mistral/openbox-3/themerc
	git clone https://github.com/shimmerproject/Orion.git $(HOME)/.themes/Orion
	mkdir -p $(HOME)/.config/openbox
	cp rc.xml $(HOME)/.config/openbox/
	cp -R lxqt $(HOME)/.config/
	sed -i -e "s@HOME@$(HOME)@" ~/.config/lxqt/panel.conf ~/.config/lxqt/session.conf

gnomeconf:
	cp dmrc $(HOME)/.dmrc
	sed -i -e 's/lxqt/gnome/' $(HOME)/.dmrc
	#cp fixctrl.desktop $(HOME)/.config/autostart/
	wget -nc -P $(HOME)/Pictures http://photojournal.jpl.nasa.gov/tiff/PIA02991.tif
	convert $(HOME)/Pictures/PIA02991.tif $(HOME)/Pictures/PIA02991.png
	dconf write /org/gnome/desktop/background/picture-uri "'file://"$(HOME)"/Pictures/PIA02991.png'"
	dconf write /org/gnome/desktop/background/picture-options "'zoom'"
	dconf write /org/gnome/desktop/wm/preferences/focus-mode "'sloppy'"
	dconf write /org/gnome/shell/favorite-apps "['org.gnome.Nautilus.desktop', 'xfce4-terminal.desktop', 'firefox.desktop', 'hexchat.desktop']"
