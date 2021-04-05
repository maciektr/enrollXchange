python manage.py migrate
(cd frontend ; yarn install)
(cd frontend ; yarn dev) &
python manage.py runserver 0.0.0.0:8000 &
python manage.py livereload
