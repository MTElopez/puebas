from base_db.dml import Tabla
from base_db.config_db import conexion as con

class Juegos(Tabla):
    tabla = 'juegos'
    campos = ('id', 'id_consola','nombre','descripcion')
    conexion = con
    
    def __init__(self, *args, de_bbdd=False):
        super().crear(args, de_bbdd)   
    
class Consola(Tabla):
    tabla = 'consola'
    campos = ('id', 'consola')
    conexion = con
    
    def __init__(self, *args, de_bbdd=False):
        super().crear(args, de_bbdd)

class Genero(Tabla):
    tabla = 'genero'
    campos = ('id', 'genero')
    conexion = con
    
    def __init__(self, *args, de_bbdd=False):
        super().crear(args, de_bbdd)

class Usuario(Tabla):
    tabla = 'usuario'
    campos = ('id', 'nombre','apellido','edad','email','contraseña')
    conexion = con
    
    def __init__(self, *args, de_bbdd=False):
        super().crear(args, de_bbdd)

class GeneroJuegos(Tabla):
    tabla = 'generos_juegos'
    campos = ('id', 'id_genero','id_juego')
    conexion = con
    
    def __init__(self, *args, de_bbdd=False):
        super().crear(args, de_bbdd)    

class ImagenJuego(Tabla):
    tabla = 'imagen_juego'
    campos = ('id', 'id_juego','url_imagen')
    conexion = con
    
    def __init__(self, *args, de_bbdd=False):
        super().crear(args, de_bbdd)    

class RequisitosPC(Tabla):
    tabla = 'requisitos_pc'
    campos = ('id', 'juego_pc_id','es_minimo','so','procesador','interfaz_grafica','memoria_ram','espacio_hd','directx')
    conexion = con
    
    def __init__(self, *args, de_bbdd=False):
        super().crear(args, de_bbdd)