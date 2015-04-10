<?php

class serviceNumber {
	
	/**
	 * Get all the bus service numbers
	 *
	 * @return Object
	 */
	public static function getAllServiceNumbers(){
        return DB::table('service_numbers')->get();
    }

}