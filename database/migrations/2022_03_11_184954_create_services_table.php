<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateServicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('services', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('owner')->nullable();
            $table->string('adventure_name')->nullable();
            $table->integer('country')->nullable();
            $table->integer('region')->nullable();
            $table->integer('service_sector')->nullable();
            $table->integer('service_category')->nullable();
            $table->integer('service_type')->nullable();
            $table->integer('service_level')->nullable();
            $table->integer('duration')->nullable();
            $table->tinyInteger('available_seats')->nullable();
            $table->dateTime('start_date')->nullable();
            $table->dateTime('end_date')->nullable();
            $table->longText('write_information')->nullable();
            $table->tinyInteger('service_plan')->nullable();
            $table->text('availability')->nullable();
            $table->text('geo_location')->nullable();
            $table->longText('specific_address')->nullable();
            $table->string('cost_inc')->nullable();
            $table->string('cost_exc')->nullable();
            $table->string('currency')->nullable();
            $table->string('points')->nullable();
            $table->longText('pre_requisites')->nullable();
            $table->longText('minimum_requirements')->nullable();
            $table->longText('terms_conditions')->nullable();
            $table->tinyInteger('recommended')->nullable();
            $table->tinyInteger('status')->nullable();
            $table->string('image')->nullable();
            $table->longText('descreption')->nullable();
            $table->string('favourite_image')->nullable();
            $table->datetime('deleted_at')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('services');
    }
}
