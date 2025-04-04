# Rails のよく使うコマンドを書く

i:
	docker compose exec web bundle install

rubocop:
	docker compose exec web bundle exec rubocop

rubocop_fix:
	docker compose exec web bundle exec rubocop -A
