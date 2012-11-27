# Getting Started with Flask and Templates

## Sample code

Download from [Github](https://github.com/johnschimmel/ITP-DWD-Week4-Templates).
See demo [http://rentspiritanimals.herokuapp.com/](http://rentspiritanimals.herokuapp.com/).

## Quick Start

* Download code.
* Open code directory in Terminal console.
* Create Virtualenv (only needs to be run once).

		virtualenv venv

* Initial PIP requirements install / Or when you need to update Python modules after modifying requirements.txt

		. runpip

	The **runpip** file is a helper file and has the following commands

		. venv/bin/activate
		pip install -r requirements.txt

* Start the Server & Activate the Virtualenv if not already active.

		. start

	The **start** file has the following commands

		. venv/bin/activate
		foreman start

* If successful you can navigate to <a href='http://localhost:5000'>http://localhost:5000</a>.

## jQuery

jQuery is a very popular and useful Javascript library that is used to minimize the amount of Javascript you need to write to manipulate HTML DOM elements, add click events and AJAX functions. We will use AJAX in all the demos on this site.

## PUSHER - Realtime Web Service

[Pusher.com](http://www.pusher.com) is a great way to add realtime events to your webapp.

Register for an account at [http://pusher.com/](http://pusher.com/). You will need to create a .env file that includes the following information about your Pusher account.

**.env**

	PUSHER_APP_ID=XXXXXX
	PUSHER_KEY=XXXXXXXXXXXXX
	PUSHER_SECRET=XXXXXXXXXXXXXX

Save your .env file.

You will have to push your new .env variables to Heroku config so their servers have your credientals.

In your code directory in Terminal run the following command.

	heroku config:add PUSHER_APP_ID=XXXXXX
	heroku config:add PUSHER_KEY=XXXXXXXXXXXXXXX
	heroku config:add PUSHER_SECRET=XXXXXXXXXXXXX

