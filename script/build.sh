if [ "$1" = "local" ]; then
  echo "Running locally"
  exit 0
fi
( cd frontend ; yarn install ; yarn build )
