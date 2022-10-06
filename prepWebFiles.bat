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
call html-minifier --collapse-whitespace --remove-comments --remove-optional-tags --remove-redundant-attributes --remove-script-type-attributes --remove-tag-whitespace --use-short-doctype --minify-css true --minify-js true -o min\greatesthits.html greatesthits.html

dir min\*.*
dir greatesthits*.*