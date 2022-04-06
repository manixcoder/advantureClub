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
        $this->call(ActivitiesSeeder::class);
        $this->call(AimedSeeder::class);
        $this->call(UsersTableSeeder::class);
        $this->call(DependencySeeder::class);
        $this->call(CountriesSeeder::class);
        $this->call(CitiesSeeder::class);
        $this->call(DurationsSeeder::class);
        $this->call(GetAllPaymentmodeSeeder::class);
        $this->call(HealthConditionsSeeder::class);
        $this->call(HeightsSeeder::class);
        $this->call(LanguagesSeeder::class);
        $this->call(PackagesSeeder::class);
        $this->call(ServicelevelsSeeder::class);
        $this->call(ServiceSectorsSeeder::class);
        $this->call(ServiceCategoriesSeeder::class);
        $this->call(ServiceTypesSeeder::class);
    }
}
