docker-compose build
docker-compose run --rm rails bundle exec rails db:create
docker-compose run rails bundle install
docker-compose run rails rails db:migrate
docker-compose run rails rake searchkick:reindex CLASS=Message
docker-compose up
