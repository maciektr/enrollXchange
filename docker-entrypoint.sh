python manage.py migrate
( cd frontend ; yarn install )
if [ "$ENVIROMENT" = "local" ]; then
  (cd frontend ; yarn dev )
else
  ( cd frontend ; yarn build )
fi
python manage.py collectstatic --noinput
if [ "$ENVIROMENT" = "local" ]; then
  gunicorn -b 0.0.0.0:8000 enrollXchange.wsgi --reload --log-level "${GUNICORN_LOG_LEVEL}"
else
  gunicorn enrollXchange.wsgi
fi

