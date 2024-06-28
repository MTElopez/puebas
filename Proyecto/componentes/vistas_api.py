from flask import jsonify
from main import app
from componentes.modelos import Juegos
from componentes.modelos import ImagenJuego


@app.route('/api-pc/juegos')
def mostrar_juegos():
    juegos = Juegos.obtener()
    dicc_juegos = [j.__dict__ for j in juegos]
    return jsonify(dicc_juegos)

@app.route('/api-pc/imagen')
def mostrar_imagen():
    imagen = ImagenJuego.obtener()
    if imagen is None:
        return jsonify([])
    
    dicc_imagen = [i.__dict__ for i in imagen]
    return jsonify(dicc_imagen)






# def mostrar_imagen():
#     imagen = ImagenJuego.obtener()
#     dicc_imagen = [i.__dict__ for i in imagen]
#     return jsonify(dicc_imagen)