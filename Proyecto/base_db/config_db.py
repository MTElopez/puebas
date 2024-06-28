import mysql.connector


config_dev = {
  'user': 'root',
  'password': '',
  'host': '127.0.0.1',
  'database': 'juegos',
}

config_prod = {
  'user': '',
  'password': '',
  'host': '',
  'database': '',
}

conexion = mysql.connector.connect(**config_dev)


