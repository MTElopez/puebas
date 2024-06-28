import mysql.connector

class Tabla:
    
    def __init__(self, n_tabla, n_campos, n_conexion):
        self.tabla = n_tabla
        self.campos = n_campos
        self.conexion = n_conexion
    
    def crear(self, valores, de_bbdd=False):
        if de_bbdd:
            for campo, valor in zip(self.campos, valores):
                setattr(self, campo, valor)
        else:
            for campo, valor in zip(self.campos[1:], valores):
                setattr(self, campo, valor)
    
    def guardar_db(self):
        campos = ', '.join(self.campos[1:])
        values_insert = ', '.join(['%s'] * (len(self.campos)-1))
        consulta = f"INSERT INTO {self.tabla} ({campos}) VALUES ({values_insert})"
        datos = tuple(vars(self).values())[1:]  # Excluir el primer campo 'id' si existe
        return self.__ejecutar_consulta(consulta, datos)

    @classmethod
    def obtener(cls, campo=None, valor=None):
        if campo is None or valor is None:
            consulta = f"SELECT * FROM {cls.tabla}"
        else:
            consulta = f"SELECT * FROM {cls.tabla} WHERE {campo} = %s"
        return cls.__ejecutar_consulta(consulta, (valor,) if valor is not None else None)

    @classmethod
    def actualizar(cls, registro):
        id = registro.pop('id')
        campos = ', '.join(f"{campo} = %s" for campo in registro.keys())
        consulta = f"UPDATE {cls.tabla} SET {campos} WHERE id = %s"
        datos = tuple(registro.values()) + (id,)
        return cls.__ejecutar_consulta(consulta, datos)

    @classmethod
    def eliminar(cls, id):
        consulta = f"DELETE FROM {cls.tabla} WHERE id = %s"
        return cls.__ejecutar_consulta(consulta, (id,))

    @classmethod
    def __ejecutar_consulta(cls, consulta, datos=None):
        try:
            cursor = cls.conexion.cursor()
            if datos:
                cursor.execute(consulta, datos)
            else:
                cursor.execute(consulta)
            
            if consulta.startswith('SELECT'):
                rta_db = cursor.fetchall()
                if rta_db:
                    resultados = [cls(*registro, de_bbdd=True) for registro in rta_db]
                    return resultados if len(resultados) > 1 else resultados[0]
                else:
                    return None
            else:
                cls.conexion.commit()
                return True

        except mysql.connector.Error as err:
            print(f"Error MySQL: {err}")
            return None
        
        finally:
            if 'cursor' in locals():
                cursor.close()




# class Tabla:
    
#     def __init__(self, n_tabla, n_campos, n_conexion):
#         self.tabla = n_tabla
#         self.campos = n_campos
#         self.conexion = n_conexion
    

#     def crear(self, valores, de_bbdd=False):
#         if de_bbdd:
#             for campo, valor in zip(self.campos, *valores):
#                 setattr(self, campo, valor)
#         else:
#             for campo, valor in zip(self.campos[1:], valores):
#                 setattr(self, campo, valor)
                
    

#     def guardar_db(self):
#         contar_campos = str(self.campos[1:]).replace("'", "`")
#         values_insert = f"({'%s, ' * (len(self.campos)-2)} %s)"
#         consulta = (f"INSERT INTO {self.tabla} {contar_campos} "
#                     f"VALUES {values_insert};")
#         datos = tuple(vars(self).values())
#         rta_db = self.__conectar(consulta, datos)
        
#         if rta_db:
#             return 'Creación exitosa.'
        
#         return 'No se pudo crear el registro.'
        
#     @classmethod
#     def obtener(cls, campo=None, valor=None):
        
#         if campo == None or valor == None:
#             consulta = ("SELECT * " 
#                        f"FROM {cls.tabla};")
#             resultado = cls.__conectar(consulta)
#         else:
#             consulta = ("SELECT * " 
#                        f"FROM {cls.tabla} "
#                        f"WHERE {campo} = %s;")
#             resultado = cls.__conectar(consulta, (valor,))
        
#         return resultado
    
#     @classmethod
#     def actualizar(cls, registro):
#         actualizar = f"UPDATE {cls.tabla} "
#         setx = 'SET'
        
#         id = registro.pop('id')
#         id = int(id) if type(id) != int else id

        
#         for a in list(registro.keys()):
#             setx += f' {a} = %s,'
        
#         setx = setx[0:-1]       
#         donde = f" WHERE id = %s;"
#         consulta = actualizar + setx + donde    
#         nvos_datos = *list(registro.values()), id
#         rta_db = cls.__conectar(consulta, nvos_datos)
        
#         if rta_db:   
#             return 'Modificación exitosa.'
        
#         return 'No se pudo modificar el registro.'


#     @classmethod
#     def eliminar(cls, id):
#         consulta = (f"DELETE FROM {cls.tabla} WHERE id = %s ;")
#         rta_db = cls.__conectar(consulta, (id,))
        
#         if rta_db:
#             return 'Eliminación exitosa.'
            
#         return 'No se pudo eliminar el registro.'
    
    
    
#     @classmethod
#     def __conectar(cls, consulta, datos=None):
        
#         try:
#             cursor = cls.conexion.cursor()
#         except Exception as e:
#             cls.conexion.connect()
#             cursor = cls.conexion.cursor()
        
#         if consulta.startswith('SELECT'):
            
#             if datos != None:
#                 cursor.execute(consulta, datos)
#             else:
#                 cursor.execute(consulta)
            
#             rta_db = cursor.fetchall()
            
#             if rta_db != []:
#                 resultado = [cls(registro, de_bbdd=True) \
#                                 for registro in rta_db]
                
#                 if len(resultado) == 1:
#                     resultado = resultado[0]
                    
#             else:
#                 resultado = False          
            
#             cls.conexion.close()
        
#         else:
            
#             try:
#                 cursor.execute(consulta, datos)
#                 cls.conexion.commit()    
#                 cls.conexion.close()
#                 resultado = True
#             except Exception as e:
#                 resultado = False
            
#         return resultado