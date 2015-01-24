---
title: Play Quickstart
sub_title: Deploy your Play app on Aptible in about 5 minutes
language: Scala
---

This guide assumes you have:
- An Aptible account,
- An SSH key associated with your Aptible user account, and
- The Aptible command line tool installed

## 1. Provision Your App
Tell the Aptible API that you want to provision an application. Until you push code and trigger a build, Aptible uses this as a placeholder.

Use the `apps:create` command: `aptible apps:create $APP_HANDLE`

For example:

```bash
aptible apps:create play-example-app
```

## 2. Add a Dockerfile and a Procfile
Aptible uses Docker to build your app's runtime environment. A Dockerfile is a list of commands used to build that image. A Procfile is then used to explicitly declare what processes Aptible should run for your app.

A few guidelines:
1. Name each file one word, capital 'D'/'P', no extension: "Dockerfile" and "Procfile"
2. Place them in the root of your repository
3. Be sure to commit both files to version control

Here is a sample Dockerfile for a Scala app using the Play framework:

```Dockerfile
[example Dockerfile]
```

Here is a sample Procfile:

```bash
[example Procfile]
```

## 3. Provision and Connect a Database
By default, `aptible db:create $DB_HANDLE` will provision a 10GB PostgreSQL database.

`aptible db:create` will return a connection string on success. The host value is mapped to a private subnet within your stack and cannot be used to connect from the outside Internet. Your containerized app can connect, however.

Add the connection string as an environmental variable to your app:

```bash
aptible config:add DATABASE_URL=$CONNECTION_STRING --app $APP_HANDLE
```


## 4. Configure a Git Remote
Add a Git remote named "aptible":

```bash
git remote add aptible git@beta.aptible.com:$APP_HANDLE.git
```

For example:

```bash
git remote add aptible git@beta.aptible.com:play-example-app.git
```

## 5. Deploy Your App
Push to the master branch of the Aptible git remote:

```bash
git push aptible master
```

If your app deploys successfully, a message will appear near the end of the remote output with a default VHOST:

```bash
VHOST play-example-app.on-aptible.com provisioned.
```

In this example, once the ELB provisions you could visit play-example-app.on-aptible.com to test out your app.
