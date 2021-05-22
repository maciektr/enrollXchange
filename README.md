# enrollXchange
![Deploy](https://github.com/jakubsolecki/enrollXchange/actions/workflows/heroku_deploy.yml/badge.svg)
![codecov.io](https://codecov.io/github/jakubsolecki/enrollXchange/coverage.svg?branch=main)

This repo contains an Python/Django application for the [enrollXchange](https://enrollxchange.herokuapp.com/) website.

## Setup
Clone this repository:
```shell script
git clone https://github.com/jakubsolecki/enrollXchange-back.git
cd enrollXchange-back
```
Copy `.env.example` to `.env` and adjust it to your configuration.

This project has a docker-compose.yml file which contains the necessary external dependencies. To run these dependencies, you first need to install Docker Desktop. Once this is installed you can run the following:
```shell script
docker-compose up
```
Alternatively, you can follow the [local setup instruction here](https://github.com/jakubsolecki/enrollXchange/tree/main/docs/local_setup.md).

Now you can visit [localhost:8000](127.0.0.1:8000) from your browser.

### Auto-formatter
We can use [black](https://github.com/psf/black) auto-formatter to seamlessly fix code formatting problems.

To utilize this solution, please use the command below.
```shell
python -m black {source_file_or_directory}
```

### Docker setup
The docker-compose file runs the following services:
- db: Used as the primary database for the app (postgres)

Note - To stop these service you can type `Ctrl-C` in the docker compose terminal which should stop the service. If this doesn't work, then do: `docker-compose down` to stop them.

You can also run the dependent services in the background with:
```shell script
docker-compose up -d
```

After container has started, you can run own command inside it via:
```shell
docker-compose exec {container_name} {command}
```
For instance you can open containers shell running:
```shell
docker-compose exec web sh
```

## Deployment
The project is automatically deployed on heroku at [this address](https://enrollxchange.herokuapp.com/).

## Export/import local database data
Before exporting/importing make sure enrollxchange_db image is up and running.

To export:
```shell script
docker exec -it enrollxchange_db pg_dump --inserts --clean -U postgres -h localhost postgres > data.sql
```

To import:
```shell script
docker exec -i enrollxchange_db psql -U postgres -h localhost postgres -t < data.sql
```

## Run the syntax checks
```shell command
docker exec -it enrollxchange_web pycodestyle .
```
