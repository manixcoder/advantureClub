<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(UsersTableSeeder::class);
        $this->call(CountriesTableSeeder::class);
        // $this->call(ActivitieTableSeeder::class);
        // $this->call(AimedTableSeeder::class);
        // $this->call(CitiesTableSeeder::class);
        
        // $this->call(DurationsTableSeeder::class);
        // $this->call(GetAllPaymentmodeTableSeeder::class);
        // $this->call(HealthConditionsTableSeeder::class);
        // $this->call(LanguagesTableSeeder::class);
        // $this->call(HeightsTableSeeder::class);
        // $this->call(PackagesTableSeeder::class);
    }
}
