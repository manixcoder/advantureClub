<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePromocodeUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('promocode_users', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('booking_id')->nullable();
            $table->integer('user_id')->nullable();
            $table->integer('service_id')->nullable();
            $table->integer('promocode_id')->nullable();
            $table->string('promocode')->nullable();
            $table->string('disc_type')->nullable();
            $table->string('disc_amt')->nullable();
            $table->string('service_amt_befor_disc')->nullable();
            $table->string('service_amt_after_disc')->nullable();
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
        Schema::dropIfExists('promocode_users');
    }
}
