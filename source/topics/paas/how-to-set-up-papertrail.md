Setting up Papertrail for production logging is easy on Aptible!

First, sign up for a Papertrail account. Once you're signed up, go to your Account page and navigate to the "Log Destinations" tab. Click "Create a Log Destination" and then "Create" again:

![/images/topics/paas/how-to-set-up-papertrail/account.png]

![/images/topics/paas/how-to-set-up-papertrail/log-destinations.png]

![/images/topics/paas/how-to-set-up-papertrail/create-log-destination.png]

Once you click "Create", you'll see a message specifying a host and port for your new log destination:

![/images/topics/paas/how-to-set-up-papertrail/destination-created.png]

Note the host and port, and return to the [Aptible Dashboard](https://dashboard.aptible.com). Click the "Account Settings" wheel next to the environment for which you'd like to set up log draining. In the next dialog, enter the host and port from the previous step for the "remote syslog host" and "remote syslog port," respectively.

You should begin to see your app's logs in Papertrail in the next several minutes.
