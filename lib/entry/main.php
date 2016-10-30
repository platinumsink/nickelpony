<?php
include('../pseudorand/generator.php');
include('../pseudorand/sender.php');
include('../psuedorand/receiver.php');

Class MainApp
{
	private instance;

	public __construct($instance)
	{
		$this->instance = $instance;
	}
}