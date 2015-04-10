<?php

class stop {
	
	/**
	 * Get all the bus stops by service number, direction id (PIVOT table)
	 *
	 * @param $snd_id (service number- direction id)
	 * @return Object
	 */
	public static function getStopsBySndId($snd_id){
	
        return DB::table('stops_arrival_times')
					->join('stops', 'stops_arrival_times.s_id', '=', 'stops.s_id')
					->where('stops_arrival_times.snd_id', '=', $snd_id)
					->groupBy('stops_arrival_times.s_id')
					->get();
    }
	
	/**
	 * Get all the buses arrival time by stop id
	 *
	 * @param $s_id (stop id)
	 * @return Object
	 */
	public static function getArrivalTimesByStopId($s_id){
	
        return DB::table('stops_arrival_times')
					->join('stops', 'stops_arrival_times.s_id', '=', 'stops.s_id')
					->join('service_numbers_directions', 'stops_arrival_times.snd_id', '=', 'service_numbers_directions.snd_id')
					->join('directions', 'service_numbers_directions.d_id', '=', 'directions.d_id')
					->join('service_numbers', 'service_numbers_directions.sn_id', '=', 'service_numbers.sn_id')
					->where('stops_arrival_times.s_id', '=', $s_id)
					->get();
    }

}