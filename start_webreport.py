#! /usr/bin/env python3
"""start Webreport web application
"""
import sys
import os
import pathlib
# sys.stdout = sys.stderr
import cgitb
import cherrypy
from webreport_cherry import Webreport
cgitb.enable()

ROOT = pathlib.Path(__file__).parent.resolve()  # '/home/taufik_z/Webreport'
os.chdir(str(ROOT))
sys.path.insert(0, str(ROOT))

application = cherrypy.tree.mount(Webreport())
cherrypy.config.update({'environment': 'embedded'})
cherrypy.config.update({'engine.autoreload_on': False})
