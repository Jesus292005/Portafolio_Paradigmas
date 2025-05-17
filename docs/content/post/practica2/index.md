+++
date = '2025-05-16'
draft = false
title = 'Práctica 2'
+++

## Introducción
## Este proyecto consiste en una aplicación web para la gestión de una biblioteca, implementada utilizando Flask para crear una API REST. La aplicación permite realizar operaciones CRUD (Crear, Leer, Actualizar, Eliminar) sobre libros y miembros de la biblioteca, así como gestionar préstamos y devoluciones de libros. Además, incluye un módulo de gestión de memoria para monitorear el uso de memoria durante la ejecución.

### API REST con Flask (biblioteca.py)

Este archivo define la aplicación web utilizando Flask. Configura rutas para manejar solicitudes HTTP y realiza operaciones como agregar libros, listar miembros, prestar libros, etc.
Cada ruta (/books, /members, /issue_book, etc.) maneja una operación específica y devuelve respuestas en formato JSON. Los datos se guardan y cargan desde archivos JSON (library.json y members.json) después de cada operación relevante. Se llama a memory_management.display_memory_usage() para monitorear el uso de memoria después de operaciones críticas.

#### Agregar un libro.

```python
@app.route('/books', methods=['POST'])
def add_book():
    data = request.json
    is_digital = data.get('is_digital', False)
    if is_digital:
        book = DigitalBook(
            int(data['id']), data['title'], data['author'], data['publication_year'],
            data['genre'], data['quantity'], data['file_format']
        )
    else:
        book = Book(
            int(data['id']), data['title'], data['author'], int(data['publication_year']),
            data['genre'], int(data['quantity'])
        )
    library.add_book(book)
    library.save_library_to_file("library.json")
    return jsonify(book.to_dict()), 201

```

#### Prestar un libro.

```python
@app.route('/issue_book', methods=['POST'])
def issue_book():
    data = request.json
    book_id = int(data['book_id'])
    member_id = int(data['member_id'])
    library.issue_book(book_id, member_id)
    library.save_library_to_file("library.json")
    return jsonify({"message": "Libro prestado satisfactoriamente!"})
```

### Modelo de Datos (biblioteca_web.py)

Define las clases principales del sistema (Book, DigitalBook, Member, Library, Genre) y sus métodos para gestionar libros, miembros y operaciones de la biblioteca.

Clase Book y DigitalBook: Representan libros físicos y digitales, respectivamente. Incluyen métodos para convertir objetos a diccionarios y viceversa (to_dict, from_dict).

Clase Member: Gestiona información de miembros y los libros que tienen prestados.

Clase Library: Contiene la lógica principal para agregar libros, prestar/devolver libros, y cargar/guardar datos en archivos JSON.

save_library_to_file y load_library_from_file permiten guardar y cargar el estado de la biblioteca.

#### Clase Book.
```python
class Book:
    def __init__(self, book_id, title, author, publication_year, genre, quantity):
        self.id = book_id
        self.title = title
        self.author = author
        self.publication_year = publication_year
        self.genre = genre
        self.quantity = quantity
        memory_management.increment_heap_allocations(1)  # Monitor de memoria

    def to_dict(self):
        return {
            "id": self.id,
            "title": self.title,
            "author": self.author,
            "publication_year": self.publication_year,
            "genre": self.genre,
            "quantity": self.quantity
        }
```

#### Clase Library.
```python
def issue_book(self, book_id, member_id):
    book = self.find_book_by_id(book_id)
    member = self.find_member_by_id(member_id)
    if book and member and book.quantity > 0:
        book.quantity -= 1
        member.issued_books.append(book_id)
        print("\nLibro prestado satisfactoriamente!\n")

```

### Gestión de Memoria (memory_management.py).
Esta monitorea las asignaciones y liberaciones de memoria durante la ejecución del programa.
La clase MemoryManagement lleva un registro de las asignaciones (heap_allocations) y liberaciones (heap_deallocations) de memoria.

El método display_memory_usage muestra el estado actual de la memoria, útil para depuración y optimización.

```python
class MemoryManagement:
    def __init__(self):
        self.heap_allocations = 0
        self.heap_deallocations = 0

    def display_memory_usage(self):
        print(f"Heap allocations: {self.heap_allocations} bytes")
        print(f"Heap deallocations: {self.heap_deallocations} bytes")
```

### Conclusión.
Este proyecto creo que es muy interesante ya que impementa Flask para la API web, las clases Book y Library son muy claras, las funciones so muy útiles y la declaración de las mismas, así como las variables me parece muy clara. Además de que este proyecto optimiza la forma en la que se usa la memoria, esto me parece muy importante y muy útil.



