<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class BusServices extends Migration {

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
			$table->integer('sn_id')->unsigned()->comment('Foreign key: service_numbers.sn_id');
			$table->string('direction_name')->comment('Bus direction name');
		});
		Schema::table('directions', function($table) {
			$table->foreign('sn_id')->references('sn_id')->on('service_numbers');
		});
		
		Schema::create('stops', function($table)
		{
			$table->increments('s_id')->comment('Primary key: Unique bus stop id');
			$table->integer('d_id')->unsigned()->comment('Foreign key: service_numbers.sn_id');
			$table->integer('sn_id')->unsigned()->comment('Foreign key: directions.d_id');
			$table->string('stop_code', 8)->comment('Bus stop number');
			$table->string('stop_name')->comment('Bus stop name');
			$table->time('arrival_time')->comment('Bus arrival name');
		});
		Schema::table('stops', function($table) {
			$table->foreign('sn_id')->references('sn_id')->on('service_numbers');
			$table->foreign('d_id')->references('d_id')->on('directions');
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
		Schema::drop('stops');
	}

}
