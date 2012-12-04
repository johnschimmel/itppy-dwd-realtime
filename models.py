# -*- coding: utf-8 -*-
from flask.ext.mongoengine.wtf import model_form
from wtforms.fields import * # for our custom signup form
from flask.ext.mongoengine.wtf.orm import validators
from flask.ext.mongoengine import *


class Circle(mongoengine.Document):
	xpos = mongoengine.IntField(required=True)
	ypos = mongoengine.IntField(required=True)
	size = mongoengine.IntField(required=True)
	color = mongoengine.StringField(default='#FF0000', required=True, max_length=7)

circle_form = model_form(Circle)


	

