CREATE DATABASE library;

USE library;

CREATE TABLE books (id serial PRIMARY KEY, title VARCHAR (255));

CREATE TABLE authors (id serial PRIMARY KEY, name VARCHAR(255));

CREATE TABLE checkouts (id serial PRIMARY KEY, book_id int, copy_id int, patron_id int, checkout_date DATE);

CREATE TABLE patrons (id serial PRIMARY KEY, name VARCHAR(255));
Query OK, 0 rows affected (0.07 sec)

CREATE TABLE copies (id serial PRIMARY KEY, book_id int, checked_out BOOLEAN);

CREATE TABLE authors_books (id serial PRIMARY KEY, author_id int, book_id int);



INSERT INTO books (title) VALUES ("Moby Dick");
INSERT INTO books (title) VALUES ("Cathedral");

INSERT INTO authors (name) VALUES ("Jason Awbrey");
INSERT INTO authors (name) VALUES ("Yvonna Contreras");

INSERT INTO authors_books (book_id, author_id) VALUES ();

SELECT books.*
FROM authors
JOIN authors_books ON authors.id = authors_books.author_id
JOIN books ON authors_books.book_id = books.id
WHERE authors.name LIKE '{$search_term}';

Get Routes

localhost:8000/librarian/catalog/search
localhost:800/patron/1/catalog/search
(render search.html.twig) < for a patron, show checkout history.. also show due date
... for a librarian, show all overdue books




completed
Get
localhost:800/patron/1/catalog/
localhost:8000/librarian/catalog/
(render the catalog.html.twig)

localhost:800/patron/1/catalog/search_by_author
localhost:800/patron/1/catalog/search_by_title


localhost:8000/librarian/catalog/search_by_title
localhost:8000/librarian/catalog/search_by_author

localhost:8000/librarian/catalog/13
localhost:800/patron/1/catalog/13
(render book.html.twig) < be sure to list the number of copies available

Post
localhost:8000/librarian/catalog/search AddBook


localhost:800/patron/1/catalog/13/checkout
(render search.html.twig)<- for checking a book out

localhost:8000/librarian/catalog/13
(render book.html.twig) <- for adding an author

Patch Routes
localhost:8000/librarian/catalog/13
(render book.html.twig) <- for updating the book name

Delete Routes
localhost:8000/librarian/catalog/13
(render search.html.twig) <- for a librarian deleting a book
