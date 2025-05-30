+++
date = '2025-05-29'
draft = false
title = 'Práctica 4'
+++

## Introducción
Esta práctica es acerca del paradigma lógico, se dividió en tres sesiones, en la primera se nos dió una introducción a prolog y al paradigma lógico, además instalamos el entorno de desarrollo. En la segunda sesión creamos algunos programas sencillos sobre prolog. En la tercera sesion continuamos analizando y creando programas en prolog ahora con un poco más de dificultad, también investigamos un poco las aplicaciones que tiene prolog, un ejemplo es la aplicación de prolog la estructura de datos: árboles.

## Primera Sesión
En esta sesión vimos que el paradigma lógico es un enfoque de la programación que se basa en la lógica matemática para definir y resolver un problema. En lugar de especificar paso a paso cómo se realiza una tarea, se definen reglas y hechos lógicos, y un sistema interferencual deduce las soluciones. Para este paradigma usamos el lenguaje de programación Prolog, este se enfoca en qué se quiere lograr, en lugar de cómo logarlo, como en los lenguajes imperativos y permite resolver problemas mediante la representación de relaciones entre objetos y la interferencia lógica.

### Segunda Sesión
Para esta sesión nos metimos de lleno a la programación en prolog, para esto realizamos algunos programas sencillos para conocer en la práctica cómo es que funciona prolog.

Este primer programa es muy simple, establece el hecho de que priya, natasha y jasmin son chicas, y debajo que priya es la única que puede cocinar, si preguntamos quién es chica, el programa devolverá los nombres priya, natasha y jasmin, si nosotros preguntamos quién puede cocinar, el programa únicamente devolverá el nombre de priya, en caso de que nosotros preguntemos si natasha o jasmin pueden cocinar, programa devolverá false.

```prolog
girl(priya).
girl(natasha).
girl(jasmin).

can_cook(priya).
```

Para el segundo programa, en nuestra base de conocimiento tenemos los sigueintes hechos: 
* ana puede cantar una canción.
* rodrigo puede escuchar música. 
Además tenemos las siguientes reglas: 
* ana escucha música si canta una canción.
* ana está feliz si canta una canción. 
* rodrigo es feliz si escucha música.
* rodrigo toca la guitarra si escucha música.

```prolog
sing_a_song(ana).
listen_to_music(rodrigo).

listen_to_music(ana) :- sing_a_song(ana).
happy(ana) :- sing_a_song(ana).
happy(rodrigo) :- listen_to_music(rodrigo).
plays_guitar(rodrigo) :- listen_to_music(rodrigo).
```

Gracias a esta base del conocimiento nosotros podemos realizar consultas como por ejemplo:
* Quién puede cantar una canción?, en este caso la única respuesta posible es ana.
* Quién está feliz?, en este caso ana y rodrigo están felices.
* Quién puede tocar la guitarra?, en este caso el único que puede tocar la guitarra es rodrigo.
* Quién puede esuchar música?, en este caso ana y rodrigo pueden escuchar música.
Entre otras.

El siguiente programa dentro de su base de conocimiento tiene los siguientes hechos:
* priya puede cocinar.
* jasmin puede cocinar.
* timoteo puede cocinar.
Y tiene las siguientes reglas:
* a priya le gusta jasmin si jasmin puede cocinar.
* a priya le gusta timoteo si timoteo puede cocinar.

```prolog
can_cook(priya).
can_cook(jasmin).
can_cook(timoteo).

like(priya, jasmin) :- can_cook(jasmin).
like(priya, timoteo) :- can_cook(timoteo).
```
Con esta base de conocimiento podemos hacer preguntas como por ejemplo:
* Quién puede cocinar?, en este caso priya?, jasmin y timoteo pueden cocinar.
* Si a priya le gusta jasmin o timoteo?, en este caso ambos son verdaderos ya que ambos pueden cocinar.

Este último programa de la segunda sesión es acerca de las relaciones entre personas, el programa tiene las siguientes reglas:
* simon es padre de pedro.
* simon es padre de raj.
* pedro es hombre.
* raj es hombre.

Reglas:
* Dos personas son hermanos si comparten al menos un padre y ambos son hombres.

```prolog
parent(simon,pedro).
parent(simon,raj).
male(pedro).
male(raj).

brother(X,Y) :- parent(Z,X), parent(Z,Y), male(X), male(Y).

```
Para este programa, según su base conocimiento, podemos hacer las siguientes preguntas:
* Quién es hombre?, en este caso sólo pedro y raj están declarados como hombres.
* Quiénes son los hijos de simon?, en este caso pedro y raj son hijos de pedro.
* pedro es hermano de raj?, para este caso el resultado será true.
* Quién es hermano de raj?, para este caso, como no tenemos una validación para que no aparezca el mismo nombre que estamos preguntando, la respuesta que nos dará el programa será que pedro y raj son hermanos de raj.

### Tercera Sesión
Para la tercera sesión vimos unos programas con una base de conocimientos con más hechos y reglas.
El primer programa, igual que el último de la sesión es sobre parentezcos familiares pero con mpás combinaciones. Dentro de los hechso se encuentra la definición de los hombres, mujeres y los padres. En las reglas se encuentra cómo saber si alguien es madre, padre, si alguien tiene hijos y si tiene hermano o hermana. 

```prolog
female(pam).
female(liz).
female(pat).
female(ann).
male(jim).
male(bob).
male(tom).
male(peter).
parent(pam,bob).
parent(tom,bob).
parent(tom,liz).
parent(bob,ann).
parent(bob,pat).
parent(pat,jim).
parent(bob,peter).
parent(peter,jim).
mother(X,Y):-parent(X,Y),female(X).
father(X,Y):-parent(X,Y),male(X).
haschild(X):-parent(X,_).
sister(X,Y):-parent(Z,X),parent(Z,Y),female(X),X\==Y.
brother(X,Y):-parent(Z,X),parent(Z,Y),male(X),X\==Y.
```

Para este programa, ejemplos de preguntas que podemos hacer es:
* Quiénes son los padres de tom?, en este caso son pam y tom.
* Quiénes son los hijos de bob?, en este caso son ann, pat y peter.
* Quiénes son mujeres?, en este caso son pam, liz, pat y ann.
* Quién es hermana de bob?, en este caso es liz.
* Quiénes tienen al menos un hijo?, en este caso pam, tom, bob, pat y peter tienen al menos un hijo.
Entre otras.


Para el siguiente programa, únicamente se le hizo un aumento en las reglas, ahora podemos saber los abuelos, esposas, y tios.

```prolog
female(pam).
female(liz).
female(pat).
female(ann).
male(jim).
male(bob).
male(tom).
male(peter).
parent(pam,bob).
parent(tom,bob).
parent(tom,liz).
parent(bob,ann).
parent(bob,pat).
parent(pat,jim).
parent(bob,peter).
parent(peter,jim).
mother(X,Y):-parent(X,Y),female(X).
father(X,Y):-parent(X,Y),male(X).
haschild(X):-parent(X,_).
sister(X,Y):-parent(Z,X),parent(Z,Y),female(X),X\==Y.
brother(X,Y):-parent(Z,X),parent(Z,Y),male(X),X\==Y.

grandparent(X,Y):-parent(X,Z),parent(Z,Y).
grandmother(X,Z):-mother(X,Y),parent(Y,Z).
grandfather(X,Z):-father(X,Y),parent(Y,Z).
wife(X,Y):-parent(X,Z),parent(Y,Z),female(X),male(Y).
uncle(X,Z):-brother(X,Y),parent(Y,Z).

```
Con estas nuevas reglas podemos hacer las siguientes preguntas:
* Quiénes con los abuelos de ann?, en este caso son pam y tom.
* Quién es la abuela de jim?, en este caso es pat.
* Quiénes son los tios de tom?, en este caso son ann, pat y peter.
* pam es esposa de tom?, en este caso no es así, entonces el programa regresa false.
Entre otras.

Para el siguiente programa se modificó el tema de abuelos, esposas y tios por los predecesores.

```prolog
female(pam).
female(liz).
female(pat).
female(ann).
male(jim).
male(bob).
male(tom).
male(peter).
parent(pam,bob).
parent(tom,bob).
parent(tom,liz).
parent(bob,ann).
parent(bob,pat).
parent(pat,jim).
parent(bob,peter).
parent(peter,jim).
mother(X,Y):-parent(X,Y),female(X).
father(X,Y):-parent(X,Y),male(X).
haschild(X):-parent(X,_).
sister(X,Y):-parent(Z,X),parent(Z,Y),female(X),X\==Y.
brother(X,Y):-parent(Z,X),parent(Z,Y),male(X),X\==Y.

predecessor(X, Z) :- parent(X, Z).
predecessor(X, Z) :- parent(X, Y), predecessor(Y, Z).

```
Con esta versión actualizada de la base de conocimiento podemos hacer las siguientes preguntas:
* Quiénes son los predecesores de bob?, en este caso los predecesores de bob son pam y tom.
* tom es predecesor de jim?, en este caso es verdad, así que el programa regresa true.
* Quiénes son los descendientes de tom?, en este caso todos los descendientes de tom son bob, liz, ann, pat, peter, jim.
Entre otras.

Para el último programa de prolog vimos es recursividad, este programa lo que hace es contar hasta 10 de forma recirsiva.

```prolog
count_to_10(10) :- write(10),nl.
count_to_10(X):-
    write(X),nl,
    Y is X + 1,
    count_to_10(Y).
```
Para este programa, lo que podemos hacer es darle un número menor a 10 y este nos mostrará recursivamente el paso uno a uno hasta llegar a 10.


### Conclusión
Prolog representa el paradigma lógico mediante hechos y reglas que describen relaciones y condiciones. Su enfoque declarativo permite resolver problemas especificando qué se debe cumplir, no cómo. Programas como los realizados (parentesco, conteo recursivo) destacan su fortaleza en: modelar relaciones complejas mediante reglas lógicas, recursión como estructura central, reemplazando bucles iterativos, consultas flexibles, donde una misma regla responde múltiples preguntas.



[Mi Respositorio](https://github.com/Jesus292005/Portafolio_Paradigmas.git "REPOSITORIO")

[Practica3](https://jesus292005.github.io/Portafolio_Paradigmas/post/practica4/)




