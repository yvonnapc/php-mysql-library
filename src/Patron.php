<?php
	 class Patron
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
			
		}

		static function getAll()
		{

		}

		static function deleteAll()
		{

		}
	}
 ?>
