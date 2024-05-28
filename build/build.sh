START_LOCATION="$(pwd)"

cd app
elm-spa build
if [ $? -eq 0 ]; then
  mkdir -p $START_LOCATION/priv/static
  cp -r public/* $START_LOCATION/priv/static

  cd $START_LOCATION
  mix run --no-halt
else
  echo "Elm build failed. Aborting build"
  cd $START_LOCATION
fi


