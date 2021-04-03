# Local development setup
Alternatively to using docker, you can setup the app development enviroment locally.

### Clone project and fill .env
Follow instructions from [main README](https://github.com/jakubsolecki/enrollXchange/blob/main/README.md).

Change `DB_HOST` variable in `.env` file to `127.0.0.1`.

### Enviromental variables
You will need to install [direnv](https://direnv.net/) in your system for enviromental variables managment.
For RedHat based (e.g. Fedora) run:
```shell
$ sudo dnf install direnv
```
For OSX (using [homebrew](https://formulae.brew.sh/formula/pipenv)):
```shell
brew install direnv
```
Then [hook it to your shell](https://direnv.net/docs/hook.html).

After installation enter project directory and run:
```shell
echo "dotenv" > .envrc
direnv allow
```
You should see output similar to:
```shell
direnv: loading ~/Documents/Projects/enrollXchange/.envrc
direnv: export +DB_HOST +DB_NAME +DB_PASSWORD +DB_PORT +DB_USER +DEBUG +ENVIROMENT +GUNICORN_LOG_LEVEL +SECRET_KEY
```
### Python dependencies
Make sure you have both `python3` and `pip` installed in your system.

You should install your project dependencies to a virtual enviroment to seperate them from your global installation. You will need [virtualenv](https://pypi.org/project/virtualenv/) for this. First, install it by running:
```shell
python -m pip install --user virtualenv
```
Then run following script for project venv setup:
```shell
python3 -m virtualenv venv
source venv/bin/activate
python3 -m pip install --upgrade pip
pip install -r requirements.txt
```
### React dependencies
Make sure you have [nodejs](https://nodejs.org/en/about/) installed in your system.

Install [yarn](https://classic.yarnpkg.com/en/docs/install/#mac-stable) by running:
```shell
npm install --global yarn
```
Then install project dependencies by running:
```shell
(cd frontend ; yarn install)
```
### Running project
Run the database.
```shell
docker-compose up db
```
Make sure that you have your venv activated (`source venv/bin/activate`), and variables loaded (`direnv allow`).

Migrate the database.
```shell
python manage.py migrate
```
To run project, start following commends in terminal (each in seperate tab).
```shell
(cd frontend ; yarn dev)
```
```shell
python manage.py runserver
```
```shell
python manage.py livereload
```
