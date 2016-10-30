<?php
include('../pseudorand/generator.php');
include('../pseudorand/sender.php');
include('../psuedorand/receiver.php');

Class MainApp
{
	private instance;
	private data_string;

	public __construct($instance)
	{
		$this->instance = $instance;
		$this->data_string = '';
	}

	public prepareData()
	{
		$this->data_string = keyPass();
	}

	public sendData()
	{
		$this->prepareData($this->data_string);
	}
}