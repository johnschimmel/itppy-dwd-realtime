import os, datetime

from flask import Flask, request # Retrieve Flask, our framework
from flask import render_template

import pusher

app = Flask(__name__)   # create our flask app

# configure pusher 
pusher.app_id = os.environ.get('PUSHER_APP_ID')
pusher.key = os.environ.get('PUSHER_KEY')
pusher.secret = os.environ.get('PUSHER_SECRET')
p = pusher.Pusher()
	

# this is our main page
@app.route("/")
def index():

	templateData = {
		'PUSHER_KEY' : os.environ.get('PUSHER_KEY')
	}
	return render_template("main.html", **templateData)

@app.route("/pushit", methods=['POST'])
def pushit():

	msg = request.form.get('msg')
	
	if msg:
		p['couch_potato'].trigger('incoming_youtube',{'msg':msg})
		return "sent " + msg

	else:
		return "did not receive msg"

@app.errorhandler(404)
def page_not_found(error):
    return render_template('404.html'), 404


# start the webserver
if __name__ == "__main__":
	app.debug = True
	
	port = int(os.environ.get('PORT', 5000)) # locally PORT 5000, Heroku will assign its own port
	app.run(host='0.0.0.0', port=port)



	