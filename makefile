add:
	git add .

clone:
	git clone https://github.com/thowes/storythings.git

commit:
	git commit

deploy:
	bundle exec rake asset:precompile
	git push heroku

info:
	@git remote show origin

orig:
	@git remote show origin

push:
	git push

repo:
	@git remote -v

st:
	@git status

tls:
	@todo.sh ls +sth

upd:
	@git pull
