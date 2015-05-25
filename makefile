clone:
	git clone https://github.com/thowes/storythings.git

deploy:
	git push heroku

info:
	@git remote show origin

orig:
	@git remote show origin

repo:
	@git remote -v

srv:
	@rails server

st:
	@git status

tls:
	@todo.sh ls +sth

tst:
	rspec spec

upd:
	@git pull
