from flask import render_template

from main import app
from componentes.modelos import Juegos
from componentes.modelos import ImagenJuego

@app.route('/')
def mos_juegos():
    juegos = Juegos.obtener()
    return render_template('./base.html', juegos=juegos)

@app.route('/imagen')
def mos_imagen():
    imagen = ImagenJuego.obtener()
    return render_template('./base.html', imagen=imagen)