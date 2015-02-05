<?php

class BusNumbersController extends BaseController {

	public $restful = true;
	
	public function getIndex()
	{
		return serviceNumbers::all();
	}
	
	public function getIndex1()
	{
		return serviceNumbers::all();
	}

}
