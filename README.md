# Customizing DokuWiki Templates

[The Bible: DokuWiki Template Development](https://www.dokuwiki.org/devel:templates)
DokuWiki Version: __2016-06-26a "Elenor of Tsort"__

## Releasing Themes

[githubにpushで、さくらサーバーに自動デプロイ](http://qiita.com/prex-uchida/items/f8bc05eb91b944b6214e) (Japanese)
Ideally, we can set up an environment where if we push to the github master branch, a webhook calls the Wiki server and it will trigger a git pull.

```php
<?
chdir('lib/tpl/openag');
exec('/usr/bin/git pull', $op, $rv);
print_r($op);
print_r($rv);
?>
```

## DokuWiki Template Basics

- DokuWiki themes live under `lib/tpl` directory.
- Theme name should be `openag` but the repo will be called `dokuwiki_template` on github

### The Template Directory: `/var/www/html/lib/tpl/openag`

- You can put the `favicon.ico` here.
- You can also save `*.js` files under your template.
- `template.info.txt` is a template manifest file for Author info. __This file is required__ [More here](https://www.dokuwiki.org/devel:template_info)
- `style.ini` holds config info including which stylesheets are loaded. [More here](https://www.dokuwiki.org/devel:style.ini)
	- >Since Binky the location and the name of the local style.ini has changed to the more farm-friendly `conf/tpl/<tpl>/style.ini`. (Where `<tpl>` needs to be substituted with the name of the template folder. Just create it if it doesn't exist.)
- `main.php`: general template.
- `detail.php`: image detail page.
- `mediamanager.php`: media selection popup.

## Modifying a template

Rewriting main.php seems to be the general approach to this. Editing the CSS works as well.

### Setting up a development environment

Overview:
Using a docker image like: https://hub.docker.com/r/mprasil/dokuwiki/
Mount the DokuWiki template directory to the git repository for the template.

1. Pull the DokuWiki image from dockerhub. `$ docker pull mprasil/dokuwiki`
1. Start the docker container. `$ docker run -dit -v $(path/to/dokuwiki_template):/dokuwiki/lib/tpl/openag -p 80:80 --name test_wiki mprasil/dokuwiki`
1. Go to `http://127.0.0.1/install.php` or `http://192.168.99.100/install.php` for docker-toolbox.
1. Make some random admin account.
1. Go to `http://<IP>/doku.php?id=start&do=admin&page=config`
1. Change `Basic/template` to `openag`

## About CSS and DokuWiki

https://www.dokuwiki.org/devel:css

- There are `modes` when you specify CSS files that you are using in `style.ini`under `[stylesheets]`
	- You specify which CSS files get used in which modes like : `hoge.css = mode`
	- `screen` is a mode for browsers
	- `print` is for printing
	- `all` is all modes. It is used for mobile as well, presumably with some media query.
	- `feed` is for the "feed"
- You can specify colors that can be used like variables in `style.ini` under `[replacements]`
	- `__background__`	main background color
	- `__background_alt__`	alternative background color
	- `__background_neu__`	neutral background color
	- `__border__`	border color
	- `__text__` main text color
	- `__text_alt__`	alternative text color
	- `__text_neu__`	neutral text color
	- `__highlight__`	highlighted text color (new since Adora Belle)

- Available file types are `.css` and `.less`.
- Naming convention for plugins is `<plugin_name>__<id>` for IDs. using `__` double underscore is safe for CSS names since you cannot have them in header titles.
