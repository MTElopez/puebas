from flask import Flask
from flask_cors import CORS

app = Flask(__name__)
CORS(app, resources={r'/api-pc/*': {'origin': '*'}})

#-----
from componentes.vistas_api import *
from componentes.vistas_web import *

if __name__ == '__main__':
    app.run()