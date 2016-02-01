## README

Study-db provides a way to easily create an online study for comparing different 
html navigation models (cases). 

Current features:
* ~~Collect demographic data of participants~~
* ~~Track how long it takes for a participant to complete one test.~~
* ~~Add polls after each navigation model, currently [NASA TLX](https://en.wikipedia.org/wiki/NASA-TLX), [attrakdiff](http://attrakdiff.de/)~~

Todo:
* Instructions page
* Multi-language, currently only german
* layouting and stylings

## Setup

Study-db is build with Rails 5 beta1, requires Ruby Version 2.3.0 and is currently configured to use Postgres.
There's no reason against using other databases e.g. SQLite. Just adjust `config/database.yml` if you want. 

```
$ git clone git@github.com:yannickschuchmann/study-db.git
$ cd study-db
$ bundle install && rails db:setup
$ rails s
```

## Example

A working example is available under <http://navigation-study.furfm.de>.
