@echo off
if not exist min (
	echo creating min dir
	mkdir min
)

del min\*.* /q

call uglifyjs greatesthitsconfig.js -o min\greatesthitsconfig.js
call uglifyjs greatesthits.js -o min\greatesthits.js
call uglifyjs greatesthitsfirstcall.js -o min\greatesthitsfirstcall.js
call uglifycss greatesthits.css --output min\greatesthits.css
copy greatesthits.html min\greatesthits.html

dir min\*.*
dir greatesthits*.*