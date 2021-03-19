python manage.py collectstatic --noinput
python manage.py migrate
gunicorn -b 0.0.0.0:8000 enrollXchange.wsgi --reload --log-level ${GUNICORN_LOG_LEVEL}
