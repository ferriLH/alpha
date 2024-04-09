setup:
	@make build
	@make up
	@make composer-install
	@make npm-install
	@make npm-run-build
build:
	docker-compose build --no-cache --force-rm
stop:
	docker-compose stop
up:
	docker-compose up -d
composer-update:
	docker exec laravel-docker bash -c "composer update"
composer-install:
	docker exec laravel-docker bash -c "composer install"
npm-install:
	docker exec laravel-docker bash -c "npm install"
npm-run-build:
	docker exec laravel-docker bash -c "npm run build"
data:
	docker exec laravel-docker bash -c "php artisan migrate"
	docker exec laravel-docker bash -c "php artisan db:seed"