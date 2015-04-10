<?php

class direction {
	
	/**
	 * Get all bus directions by service number 
	 *
	 * @param $sn_id (service number id)
	 * @return Object
	 */
	public static function getDirectionsByServiceNumber($sn_id) {
	
        return DB::table('service_numbers_directions')
					->join('directions', 'service_numbers_directions.d_id', '=', 'directions.d_id')
					->join('service_numbers', 'service_numbers_directions.sn_id', '=', 'service_numbers.sn_id')
					->where('service_numbers.sn_id', '=', $sn_id)
					->get();
    }

}