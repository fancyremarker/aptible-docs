To set an ENV variable for your app, use `aptible config:set`, like so:

    aptible config:set VAR=value --app $APP_HANDLE

To view the existing set of ENV variables and their values, run:

    aptible config --app $APP_HANDLE
