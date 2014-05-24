#dest=~/Dropbox/Apps/FarBox/marboo
dest=/tmp/marboo.biz
default:
	cp ~/Library/Application\ Support/Marboo/www/misc/marboo-doc/README.rst.html guide/index.html
	#cp ~/.marboo/build/marboo/install.rst.html install-crx.html
	jade -O index.jade.json < views/index.jade > /tmp/marboo.biz/index.html
	jade -O zh_CN/index.jade.json < views/index.jade > /tmp/marboo.biz/zh_CN/index.html
	#find . -name *.jade | xargs jade -P
	jekyll build -s . -d ${dest}
	cp -r ../../media/marboo.biz ${dest}/media/
	mkdir ${dest}/media/css
	cp -r ../../media/css/bootstrap.min.css ${dest}/media/css
	#find .|grep index.html | xargs rm -f
	find /tmp/marboo.biz|grep jade$$ |xargs rm -f
	find /tmp/marboo.biz|grep json$$ |xargs rm -f
	cp ~/Library/Application\ Support/Marboo/www/WebSites/marboo.biz/source/install.md.html i/build/Marboo-for-Web-介绍.md.html
	cp ~/Library/Application\ Support/Marboo/www/WebSites/marboo.biz/source/install.md.html install-crx.html

clean:
	find .|grep index.html | xargs rm -f

notes:
	cp ~/.marboo/build/slides/marboo-intro.remark.md.html ~/.marboo/source/WebSites/marboo.biz/i/build
	cp ~/.marboo/build/MyNotes.localized/Poem/a-blooming-tree.poem.md.html ~/.marboo/source/WebSites/marboo.biz/i/build/一颗开花的树.poem.md.html
	cp ~/.marboo/build/media/demo/syntax-highlight/hello-world.c.html ~/.marboo/source/WebSites/marboo.biz/i/build
