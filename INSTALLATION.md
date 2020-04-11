### Docker commands to setup application stack

#### Creating Rails image
`docker build -t rails-toolbox -f Dockerfile.rails .`

#### Createing new Rails project using in-container `rails` gem
`docker run -it -v $PWD:/opt/app rails-toolbox rails new --skip-bundle --database=postgresql drkiq`

#### Creating application image
`docker build -t drkiq -f Dockerfile .`

#### Creating volumes for Redis and Postgres
```bash
docker volume create --name drkiq-postgres
docker volume create --name drkiq-redis
```

#### Run docker-compose to start the whole stack
`docker-compose up`

#### Creating database
```bash
docker-compose run drkiq rake db:reset
docker-compose run drkiq rake db:migrate
```

#### Finally start the whole stack
`docker-compose up`
