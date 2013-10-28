Práctica #6
=========== 

Despliegue en Heroku
--------------------

Autor: Diego Williams Aguilar Montaño

Descripción de la práctica
--------------------------
Esta práctica sigue como continuación de la práctica.......: "[Añadir Hojas de estilo a Rock, Paper, Scissors](https://dl.dropboxusercontent.com/u/14539152/LPP/LPPbook/node360.html)" añadiendo una sesión para llevar los contadores de las partidas de los jugadores, es decir, el número de victorias empates y derrotas, para ello se ha establecido una cookie usando Rack::Response junto a las modificaciones del fichero index.haml para mostrar la tabla de contadores de las partidas; tambíen se han implementado Pruebas Unitarias (directorio /test) así como también desarrollo dirigido por pruebas (TDD) (directorio /spec).


Instrucciones
-------------

1. Realizar un bundle install para instalar las gemas requeridas del fichero gemset proporcionado:

        $ bundle install

2. Arrancar el servidor mediante el archivo rake proporcionado:

        $ rake
3. El servidor arrancará.  
4. Ahora visitamos la página [http://localhost:8080](http://localhost:8080) en el navegador preferido para jugar en la App.  
5. Para realizar los test con pruebas unitarias ejecutar mediante el archivo rake proporcionado:

        $ rake test
6. Para realizar los test con Rspec ejecutar mediante el archivo rake proporcionado:

        $ rake spec
---

Universidad de La Laguna  
Escuela Técnica Superior de Ingeniería Informática  
Sistemas y Tecnologías Web 2013-14