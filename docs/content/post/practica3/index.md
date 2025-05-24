+++
date = '2025-05-22'
draft = false
title = 'Práctica 3'
+++

## Introducción
Esta práctica es acerca del paradigma funcional, se dividió en dos sesiones, en la primera se nos dió una introducción a haskell y al paradigma funcional. En la segunda sesión nos dedicamos a analizar una app realizada con haskell.


### Primera Sesión
Para la primera sesión lo primero que hicimos fue ingresar al sitio web de haskell, ejecutar el comando de instalación, seleccionamos directorios por defecto, así como los módulos adicionales. Después de que tuvieramos todo instalado abrimos git-bash, ejecutamos el comando 'ghc --version' para confirmar que todo se ha instalado correctamente, creamos un nuevo folder para esta práctica y dentro creamos un nuevo archivo llamado 'helloworld.hs', dentro agregamos el siguiente código:

```haskell
main :: IO ()
main = putStrLn "Hello World!"
```

Posteriormente compilamos el programa y ejecutamos el archivo binario que se generó. Todo esto era simplemente una breve introducción a haskell y al paradigma funcional.

#### Segunda Sesión
En la segunda sesión se nos compartió una aplicación y debíamos analizarla para saber que es, para que sirve y cómo funciona. 
La aplicación básicamente nos sirve para listar tareas desde la terminal, podemos agregar, eliminar, listar tareas, además se puede abrir una página wen cuando la inicias.
* Con el comando '+' podemos crear una nueva tarea.
* Con el comando '-' podemos eliminar una tarea.
* Con el comando 'e' podemos editar una tarea.
* Con el comando 'l' podemos mostrar la lista de tareas.
* Con el comando 'r' podemos voltear la lista de tareas.
* Con el comando 'c' podemos borrar todas las tareas.
* Con el comando 'q' salimos. 

### Conclusión.
Esta app es muy simple pero muy útil para poder gestionar las tareas que podamos tener, todo esto gracias a Haskell y al paradigma funcional.

[Mi Respositorio](https://github.com/Jesus292005/Portafolio_Paradigmas.git "REPOSITORIO")

[Practica3](https://jesus292005.github.io/Portafolio_Paradigmas/post/practica3/)
