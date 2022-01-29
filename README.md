# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

Ruby version is 3.0.3

- System dependencies

elastic search
Docker

- Database creation
  docker-compose run rails rails db:create

[without docker]
rails db:create

- Database initialization
  docker-compose run rails rails db:migrate

[without docker]
rails db:migrate

- Services
  job queues
  search engines (elastic search with searchkick)

- Deployment instructions
  at first time run the script setup.sh, it will make all the setups you need to create the rails container and the dependencies and it will run the system.

  after that, any time you want to run the container again, just type CMD "docker-compose up"

  Don't forget to :-

  "docker-compose stop"

  "docker-compose down"

  after finishing

- Notes

[If you use Docker to run the application]

this application has a simple GUI, and it runs using action cable to make real-time chat application.

    but, after the docker deployment, it doesn't work properly due to security issues. So, when you create a new message or chat please refresh the page to show it.

also, there's an error in the rspec gems compatibilty with the sources in container in docker. So, there's problems running the specs within docker

[If you run it manually]

you will enjoy a real-time chat Application and you will use the action cable service.

also you can run the specs and see the tests passed as in the screenshot attached.

- TODO

Fancy GUI

resolving the security issue of action cable and docker to have a good GUI

resolving the incompatibilty issues of rspec testing in the deployment
