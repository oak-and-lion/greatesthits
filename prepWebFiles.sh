if [ ! -d "min" ]
then
	mkdir min
fi

rm min/*.*

uglifyjs greatesthits.js -o min/greatesthits.js
uglifyjs greatesthitsconfig.js -o min/greatesthitsconfig.js
uglifyjs greatesthitsfirstcall.js -o min/greatesthitsfirstcall.js
uglifycss greatesthits.css --output min/greatesthits.css
cp greatesthits.html min/greatesthits.html
ls -l greatesthits*.*
ls -l min/
