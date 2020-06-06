.PHONY: new build setup db

new:
	docker-compose run web rails new . --force --no-deps --database=postgresql

build:
	docker-compose build
	docker-compose run web bundle install

setup:
	docker-compose run web rails webpacker:install

db:
	docker-compose run web rake db:create
