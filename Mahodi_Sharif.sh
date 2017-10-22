Skip to content
This repository
Search
Pull requests
Issues
Marketplace
Explore
 @mahodi99
 Sign out
 Watch 0
  Star 0  Fork 0 mahodi99/Mahdisharif
 Code  Issues 0  Pull requests 0  Projects 0  Wiki  Insights  Settings
Branch: master Find file Copy pathMahdisharif/TH3BOSS.sh
55dcd66  19 days ago
@moody2020 moody2020 TH3BOSS ┇ Final Version 20
1 contributor
RawBlameHistory     
47 lines (41 sloc)  1009 Bytes

THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR

install() {
		sudo apt-get update -y
		sudo apt-get upgrade -y
		sudo apt-get install lua5.1 lua-socket lua-sec redis-server curl -y
		sudo apt-get install libreadline-dev libssl-dev lua5.2 luarocks liblua5.2-dev curl libcurl4-gnutls-dev -y
		git clone http://github.com/keplerproject/luarocks
		cd luarocks
		./configure --lua-version=5.2
		make build
		sudo make install
		sudo luarocks install Lua-cURL
		sudo luarocks install oauth
		sudo luarocks install redis-lua
		sudo luarocks install lua-cjson
		sudo luarocks install ansicolors
		sudo luarocks install serpent
		cd ..
}


red() {
  printf '\e[1;31m%s\n\e[0;39;49m' "$@"
}
green() {
  printf '\e[1;32m%s\n\e[0;39;49m' "$@"
}
white() {
  printf '\e[1;37m%s\n\e[0;39;49m' "$@"
}
update() {
	git pull
}

if [ "$1" = "install" ]; then
	install
elif [ "$1" = "update" ]; then
	update
	exit 1
else
green " جاري تشغيل سورس مهدي تــوكــن   ...	"
lua ./bot/bot.lua
fi
© 2017 GitHub, Inc.
Terms
Privacy
Security
Status
Help
Contact GitHub
API
Training
Shop
Blog
About
