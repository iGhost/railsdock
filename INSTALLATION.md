### Docker commands to setup application stack

#### Creating Rails image
`docker build -t rails-toolbox -f Dockerfile.rails .`

#### Createing new Rails project using in-container `rails` gem
`docker run -it -v $PWD:/opt/app rails-toolbox rails new --skip-bundle --database=postgresql drkiq`

#### Creating application image
`docker build -t drkiq -f Dockerfile .`
