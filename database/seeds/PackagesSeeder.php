<?php

use Illuminate\Database\Seeder;

class PackagesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('packages')->delete();
		$packagesData = array(
			array(
				'id' => 1,
				'title'=>'Free',
                'symbol'=>'$',
                'duration'=>'1 Week',
                'cost'=>'0',
                'offer_cost'=>'0',
                'days'=>'7',
                'status'=>'1',
				'created_at' =>  date("Y-m-d H:i:s"),
				'updated_at' =>  date("Y-m-d H:i:s"),
			),
        );
		DB::table('packages')->insert($packagesData);
    }
}
