# Realtime: Making intefaces for fun and the impatient

See demo <http://itppy-realtime-demo.herokuapp.com/>

This semester we've done a lot of GET & POST & GET & POST. We've waiting for pages to redirect and load. 

There are a few tools/techniques that support semi-realtime and realtime interface experiences. The best example is a chat room where after you post a messsage the message is shared with the room and the page doesn't need to refresh. Or you might think of GMail where your email autoloads as it arrives (or loads with a slight delay).

## AJAX

AJAX - Asynchronous JavaScript and XML - is a popular front-end JavaScript technique to GET or POST in the background of a web page allowing some operation without having the user experience a 'page refresh'.

The easiest way to use JavaScript is to use a JavaScript library like jQuery. jQuery is a great tool for front-end DOM manipulation as well as AJAX across a variety of browsers.

## Websockets

Websockets allow clients (ie browsers) stay connected via a persistent connection to a server. This allows the server to PUSH data to clients in a near realtime experience. The clients may also PUSH data back to the server which might be broadcasted to all other clients. 

Websockets are fairly new, Heroku just started to support them only last month. 

The easiest way to try out websockets are with web services like [Pusher](http://pusher.com/) app that host the websocket servers/connection points. You include some client side JavaScript and the clients connect to Pusher. Your web app/ server can then push announcements to all clients by sending a message to the Pusher server.



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


* Initialize GIT repo and Heroku app

		git init
		git add .
		git commit -am "init commit"

		heroku create

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


## Start server

* Start the Server & Activate the Virtualenv if not already active.

		. start

	The **start** file has the following commands

		. venv/bin/activate
		foreman start

* If successful you can navigate to <a href='http://localhost:5000'>http://localhost:5000</a>.
