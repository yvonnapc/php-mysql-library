<?php
	 class Author
		{
		private $name;
		private $id;

		function __construct($name, $id = NULL)
		{
			$this->name = $name;
			$this->id = $id;
		}
		 function getName()
		 {
			return $this->name;
			}

		function setName($name)
		{
			$this->name = $name;
		}

		function getId()
		{
			return $this->id;
		}

		function save()
		{
			$GLOBALS['DB']->exec(
			"INSERT INTO authors
			(name)
			VALUES
			('{$this->getName()}')"
		);
			$this->id = $GLOBALS['DB']->lastInsertId();
		}

		static function getAll()
		{
			$returned_authors = $GLOBALS['DB']->query("SELECT * FROM authors;");
			$authors = array();
			foreach($returned_authors as $author) {
				$name = $author['name'];
				$id = $author['id'];
				$new_author = new Author($name, $id);
				array_push($authors, $new_author);
			}
			return $authors;
		}

		static function deleteAll()
		{
			$GLOBALS['DB']->exec("DELETE FROM authors");
		}

		static function find($search_id)
		{
			$found_author = null;
			$authors = Author::getAll();
			foreach($authors as $author) {
				$author_id = $author->getId();
				if ($author_id == $search_id) {
				  $found_author = $author;
				}
			}
			return $found_author;
		}
		static function delete()
		{
			$GLOBALS['DB']->exec("DELETE FROM authors WHERE id = {$this->findId()};");
		}
	}
 ?>
