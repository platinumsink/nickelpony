<?php
include('../pseudorand/generator.php');
include('../pseudorand/sender.php');
include('../psuedorand/receiver.php');
include('../psuedorand/renderer.php');

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

	public shutdown()
	{
		$this->instance = null;
		$this->data_string = '';
	}

	public rewind()
	{
		$this->data_string = '';
		$this->data_string = notAtAllRand();
	}
}