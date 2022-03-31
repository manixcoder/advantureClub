<?php

use Illuminate\Database\Seeder;

class HealthConditionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('health_conditions')->delete();
		$health_conditionsData = array(
			array(
				'id' => 1,
				'name'=>'Good condition',
				'created_at' =>  date("Y-m-d H:i:s"),
				'updated_at' =>  date("Y-m-d H:i:s"),
			),
            array(
				'id' => 2,
				'name'=>'Bone weakness',
				'created_at' =>  date("Y-m-d H:i:s"),
				'updated_at' =>  date("Y-m-d H:i:s"),
			),
            array(
				'id' => 3,
				'name'=>'Breath weakness',
				'created_at' =>  date("Y-m-d H:i:s"),
				'updated_at' =>  date("Y-m-d H:i:s"),
			),
            array(
				'id' => 4,
				'name'=>'Muscles issues',
				'created_at' =>  date("Y-m-d H:i:s"),
				'updated_at' =>  date("Y-m-d H:i:s"),
			),
            array(
				'id' => 5,
				'name'=>'Backbone issues',
				'created_at' =>  date("Y-m-d H:i:s"),
				'updated_at' =>  date("Y-m-d H:i:s"),
			),
            array(
				'id' => 6,
				'name'=>'Joints issues',
				'created_at' =>  date("Y-m-d H:i:s"),
				'updated_at' =>  date("Y-m-d H:i:s"),
			),
            array(
				'id' => 7,
				'name'=>'Ligament issues',
				'created_at' =>  date("Y-m-d H:i:s"),
				'updated_at' =>  date("Y-m-d H:i:s"),
			),

		);
		DB::table('health_conditions')->insert($health_conditionsData);
    }
}
