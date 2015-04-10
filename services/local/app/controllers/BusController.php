<?php
use Chrisbjr\ApiGuard\Controllers\ApiGuardController;

class BusController extends ApiGuardController {
	
	/**
	 * Get all the bus service numbers
	 *
	 * @return JSON
	 */
	public function getBusNumbers()
	{	
		//Get buses
		$all_busses =  serviceNumber::getAllServiceNumbers();
		
		//Check if records exist
		if(count($all_busses)){
			return Response::json(array("success"=>true, "list"=>$all_busses));
		}else{
			return Response::json(array("error"=>true, "errorMessage"=>"No records found!"));
		}
	}
	
	/**
	 * Get all bus directions by service number 
	 *
	 * @param $sn_id (service number id)
	 * @return JSON
	 */
	public function getBusDirections($sn_id = false)
	{
		//Check if service number coming from request
		if(!$sn_id){
			return Response::json(array("error"=>true, "errorMessage"=>"We're Sorry. Something went wrong with your request. Please try again later."));
		}
		
		//Get bus directions
		$all_directions = direction::getDirectionsByServiceNumber($sn_id);
		
		//Check if records exist
		if(count($all_directions)){
			return Response::json(array("success"=>true, "list"=>$all_directions));
		}else{
			return Response::json(array("error"=>true, "errorMessage"=>"No records found!"));
		}
	}
	
	/**
	 * Get all the bus stops by service number, direction id (PIVOT table)
	 *
	 * @param $snd_id (service number- direction id)
	 * @return JSON
	 */
	public function getBusStops($snd_id = false)
	{
		//Check if service-number-direction-id coming from request
		if(!$snd_id){
			return Response::json(array("error"=>true, "errorMessage"=>"We're Sorry. Something went wrong with your request. Please try again later."));
		}
		
		//Get bus stops
		$all_stops = stop::getStopsBySndId($snd_id);
		
		//Check if records exist
		if(count($all_stops)){
			return Response::json(array("success"=>true, "list"=>$all_stops));
		}else{
			return Response::json(array("error"=>true, "errorMessage"=>"No records found!"));
		}
	}
	
	/**
	 * Get all the buses arrival time by stop id
	 *
	 * @param $s_id (stop id)
	 * @return JSON
	 */
	public function getBusArrivalTime($s_id = false)
	{
		//Check if stop id coming from request
		if(!$s_id){
			return Response::json(array("error"=>true, "errorMessage"=>"We're Sorry. Something went wrong with your request. Please try again later."));
		}
		
		//Get bus arrival time
		$arrival_times = stop::getArrivalTimesByStopId($s_id);
		
		//Check if records exist
		if(count($arrival_times)){
			return Response::json(array("success"=>true, "list"=>$arrival_times));
		}else{
			return Response::json(array("error"=>true, "errorMessage"=>"No records found!"));
		}
	}

}
