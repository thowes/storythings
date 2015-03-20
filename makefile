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

st:
	@git status

tls:
	@todo.sh ls +sth

upd:
	@git pull
