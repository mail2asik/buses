<?php

class BusController extends BaseController {
	
	/**
	 * Get all the bus service numbers by the controller
	 *
	 * @return JSON
	 */
	public function getBusNumbers()
	{
		$all_busses =  serviceNumbers::all();
		if(count($all_busses)){
			return Response::json(array("success"=>true, "list"=>$all_busses));
		}else{
			return Response::json(array("error"=>true, "errorMessage"=>"No records found!"));
		}
	}
	
	/**
	 * Get all the bus directions using service number 
	 *
	 * @param $sn_id (service number id)
	 * @return JSON
	 */
	public function getBusDirections($sn_id)
	{
		$all_directions = directions::where('sn_id', $sn_id)->get();
		if(count($all_directions)){
			return Response::json(array("success"=>true, "list"=>$all_directions));
		}else{
			return Response::json(array("error"=>true, "errorMessage"=>"No records found!"));
		}
	}
	
	/**
	 * Get all the bus stops using service number & direction id 
	 *
	 * @param $sn_id (service number id)
	 * @param $d_id (direction id)
	 * @return JSON
	 */
	public function getBusStops($sn_id, $d_id)
	{
		$all_stops = stops::where('sn_id', $sn_id)->where('d_id', $d_id)->get();
		if(count($all_stops)){
			return Response::json(array("success"=>true, "list"=>$all_stops));
		}else{
			return Response::json(array("error"=>true, "errorMessage"=>"No records found!"));
		}
	}
	
	/**
	 * Get all the buses using service number, direction id & stop id
	 *
	 * @param $sn_id (service number id)
	 * @param $d_id (direction id)
	 * @param $s_id (stop id)
	 * @return JSON
	 */
	public function getBusArrivalTime($sn_id, $d_id, $s_id)
	{
		$arrival_times = DB::table('service_numbers')
					->join('directions', 'directions.sn_id', '=', 'service_numbers.sn_id')
					->join('stops', 'stops.d_id', '=', 'directions.d_id')
					->where('stops.s_id', '=', $s_id)
					->get();
		
		if(count($arrival_times)){
			return Response::json(array("success"=>true, "list"=>$arrival_times));
		}else{
			return Response::json(array("error"=>true, "errorMessage"=>"No records found!"));
		}
	}

}
