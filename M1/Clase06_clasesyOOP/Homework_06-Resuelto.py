#!/usr/bin/env python
# coding: utf-8

# ## Clases y Programación Orientada a Objetos

# 1) Crear la clase vehículo que contenga los atributos:<br>
# Color<br>
# Si es moto, auto, camioneta ó camión<br>
# Cilindrada del motor

# In[1]:


class Vehiculo:
    def __init__(self, color, tipo, cilindrada):
        self.color = color
        self.tipo = tipo
        self.cilindrada = cilindrada


# 2) A la clase Vehiculo creada en el punto 1, agregar los siguientes métodos:<br>
# Acelerar<br>
# Frenar<br>
# Doblar<br>

# In[5]:


class Vehiculo:
    def __init__(self, color, tipo, cilindrada):
        self.color = color
        self.tipo = tipo
        self.cilindrada = cilindrada
        self.velocidad = 0
        self.direccion = 0

    def Acelerar(self, vel):
        self.velocidad += vel

    def Frenar(self, vel):
        self.velocidad -= vel
    
    def Doblar(self, grados):
        self.direccion += grados


# 3) Instanciar 3 objetos de la clase vehículo y ejecutar sus métodos, probar luego el resultado

# In[6]:


a1 = Vehiculo('rojo', 'auto', 2)
a2 = Vehiculo('blanco', 'camioneta', 3.6)
a3 = Vehiculo('negro', 'moto', 1)


# In[7]:


a1.Acelerar(40)
a2.Acelerar(60)
a3.Acelerar(30)
a1.Doblar(30)
a3.Doblar(-30)
a2.Frenar(-50)


# 4) Agregar a la clase Vehiculo, un método que muestre su estado, es decir, a que velocidad se encuentra y su dirección. Y otro método que muestre color, tipo y cilindrada

# In[12]:


class Vehiculo:
    def __init__(self, color, tipo, cilindrada):
        self.color = color
        self.tipo = tipo
        self.cilindrada = cilindrada
        self.velocidad = 0
        self.direccion = 0

    def Acelerar(self, vel):
        self.velocidad += vel

    def Frenar(self, vel):
        self.velocidad -= vel
    
    def Doblar(self, grados):
        self.direccion += grados

    def Estado(self):
        print('Velocidad:', self.velocidad, '- Dirección:', self.direccion)

    def Detalle(self):
        print('Soy', self.tipo, 'de color', self.color, 'y mi cilindrada es de', self.cilindrada, 'litros')


# In[13]:


a1 = Vehiculo('rojo', 'auto', 2)
a1.Detalle()


# In[14]:


a1.Estado()
a1.Acelerar(30)
a1.Estado()


# 5) Crear una clase que permita utilizar las funciones creadas en la práctica del módulo 7<br>
# Verificar Primo<br>
# Valor modal<br>
# Conversión grados<br>
# Factorial<br>

# In[33]:


class Herramientas:
    def __init__(self) -> None:
        pass

    def verifica_primo(self, nro):
        es_primo = True
        for i in range(2, nro):
            if nro % i == 0:
                es_primo = False
                break
        return es_primo

    def valor_modal(self, lista, menor):
        lista_unicos = []
        lista_repeticiones = []
        if len(lista) == 0:
            return None
        if (menor):
            lista.sort()
        else:
            lista.sort(reverse=True)
        for elemento in lista:
            if elemento in lista_unicos:
                i = lista_unicos.index(elemento)
                lista_repeticiones[i] += 1
            else:
                lista_unicos.append(elemento)
                lista_repeticiones.append(1)
        moda = lista_unicos[0]
        maximo = lista_repeticiones[0]
        for i, elemento in enumerate(lista_unicos):
            if lista_repeticiones[i] > maximo:
                moda = lista_unicos[i]
                maximo = lista_repeticiones[i]
        return moda, maximo

    def conversion_grados(self, valor, origen, destino):
        valor_destino = None
        if (origen == 'celsius'):
            if (destino == 'celsius'):
                valor_destino = valor
            elif (destino == 'farenheit'):
                valor_destino = (valor * 9 / 5) + 32
            elif (destino == 'kelvin'):
                valor_destino = valor + 273.15
            else:
                print('Parámetro de Destino incorrecto')
        elif (origen == 'farenheit'):
            if (destino == 'celsius'):
                valor_destino = (valor - 32) * 5 / 9
            elif (destino == 'farenheit'):
                valor_destino = valor
            elif (destino == 'kelvin'):
                valor_destino = ((valor - 32) * 5 / 9) + 273.15
            else:
                print('Parámetro de Destino incorrecto')
        elif (origen == 'kelvin'):
            if (destino == 'celsius'):
                valor_destino = valor - 273.15
            elif (destino == 'farenheit'):
                valor_destino = ((valor - 273.15) * 9 / 5) + 32
            elif (destino == 'kelvin'):
                valor_destino = valor
            else:
                print('Parámetro de Destino incorrecto')
        else:
            print('Parámetro de Origen incorrecto')
        return valor_destino

    def factorial(self, numero):
        if(type(numero) != int):
            return 'El numero debe ser un entero'
        if(numero < 0):
            return 'El numero debe ser pisitivo'
        if (numero > 1):
            numero = numero * self.factorial(numero - 1)
        return numero


# In[34]:


h = Herramientas()


# 6) Probar las funciones incorporadas en la clase del punto 5

# In[28]:


h.verifica_primo(7)


# In[29]:


listado = [1,8,2,5,4,8,10,7]
moda, repe = h.valor_modal(listado, True)
print('El valor modal es', moda, 'y se reptie', repe, 'veces')


# In[31]:


h.conversion_grados(10, 'celsius', 'kelvin')


# In[35]:


h.factorial(6)


# 7) Crear un archivo .py aparte y ubicar allí la clase generada en el punto anterior. Luego realizar la importación del módulo y probar alguna de sus funciones

# In[1]:


from herramientas import *


# In[2]:


h2 = Herramientas([1,1,2,3,5,6,8,8])


# In[3]:


h2.verifica_primo()

