.PHONY: test mammoth-xp.js npm-install

test:
	npm test

setup: npm-install mammoth-xp.min.js

npm-install:
	npm install

mammoth-xp.js:
	node_modules/.bin/browserify lib/index.js --standalone mammoth-xp -p browserify-prepend-licenses > dist/$@

mammoth-xp.min.js: mammoth-xp.js
	node_modules/.bin/uglifyjs dist/mammoth-xp.js -c > dist/$@
