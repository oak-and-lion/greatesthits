if [ ! -d "min" ]
then
	mkdir min
fi

rm min/*.*

uglifyjs greatesthits.js -o min/greatesthits.js
uglifyjs greatesthitsconfig.js -o min/greatesthitsconfig.js
uglifyjs greatesthitsfirstcall.js -o min/greatesthitsfirstcall.js
uglifycss greatesthits.css --output min/greatesthits.css
html-minifier --collapse-whitespace --remove-comments --remove-optional-tags --remove-redundant-attributes --remove-script-type-attributes --remove-tag-whitespace --use-short-doctype --minify-css true --minify-js true -o min/greatesthits.html greatesthits.html
ls -l greatesthits*.*
ls -l min/
