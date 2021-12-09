<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMerchantTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('merchant', function (Blueprint $table) {
            $table->id();
            $table->string('merchant_id')->nullable();
            $table->string('display_name')->nullable();
            $table->string('contact_number')->nullable();
            $table->string('business_name')->nullable();
            $table->string('business_type')->nullable();
            $table->timestamp('activation_date')->nullable();
            $table->boolean('account_access')->default(0)->nullable();
            $table->string('additional_website_app')->nullable();
            $table->float('limit_per_transaction')->nullable()->default(0);
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
        Schema::dropIfExists('merchant');
    }
}
