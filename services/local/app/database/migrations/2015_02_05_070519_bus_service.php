<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class BusService extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('service_numbers', function($table)
		{
			$table->increments('sn_id')->comment('Primary key: Unique bus service number id');
			$table->string('service_number', 6)->unique()->comment('Unique bus service number');
		});
		
		Schema::create('directions', function($table)
		{
			$table->increments('d_id')->comment('Primary key: Unique bus direction id');
			$table->string('direction_name')->comment('Bus direction name');
		});
		
		Schema::create('service_numbers_directions', function($table)
		{
			$table->increments('snd_id')->comment('Primary key: Unique bus service number with direction id');
			$table->integer('sn_id')->unsigned()->comment('Foreign key: service_numbers.sn_id');
			$table->integer('d_id')->unsigned()->comment('Foreign key: directions.d_id');
		});
		Schema::table('service_numbers_directions', function($table) {
			$table->foreign('sn_id')->references('sn_id')->on('service_number');
			$table->foreign('d_id')->references('d_id')->on('direction');
		});
		
		Schema::create('stops', function($table)
		{
			$table->increments('s_id')->comment('Primary key: Unique bus stop id');
			$table->string('stop_code', 8)->comment('Bus stop number');
			$table->string('stop_name')->comment('Bus stop name');
		});
		
		Schema::create('stops_arrival_times', function($table)
		{
			$table->increments('sat_id')->comment('Primary key: Unique bus arrival time id');
			$table->integer('snd_id')->unsigned()->comment('Foreign key: service_number_direction.snd_id');
			$table->integer('s_id')->unsigned()->comment('Foreign key: stop.s_id');
			$table->time('arrival_time')->comment('Bus arrival name');
		});
		Schema::table('stop_arrival_time', function($table) {
			$table->foreign('snd_id')->references('snd_id')->on('service_number_direction');
			$table->foreign('s_id')->references('s_id')->on('stop');
		});
		
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('service_numbers');
		Schema::drop('directions');
		Schema::drop('service_numbers_directions');
		Schema::drop('stops');
		Schema::drop('stops_arrival_times');
	}

}
