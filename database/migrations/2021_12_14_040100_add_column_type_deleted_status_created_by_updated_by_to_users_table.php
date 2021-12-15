<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnTypeDeletedStatusCreatedByUpdatedByToUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (Schema::hasColumn('type', 'deleted', 'status', 'created_by', 'updated_by')) {
            Schema::table('users', function (Blueprint $table) {
                $table->integer('type')->after('remember_token')->comment('user_type');
                $table->integer('deleted')->after('type')->default(0)->comment('1 is deleted this record else not deleted');
                $table->boolean('status')->after('deleted')->default(1)->comment('1 is active 0 is inactive');
                $table->integer('created_by')->after('status')->default(0)->comment('users.id');
                $table->integer('updated_by')->after('created_by')->default(0)->comment('users.id');
            });
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            if (Schema::hasColumn('type', 'deleted', 'status', 'created_by', 'updated_by')) {
                $table->dropColumn('type');
                $table->dropColumn('deleted');
                $table->dropColumn('status');
                $table->dropColumn('created_by');
                $table->dropColumn('updated_by');
            }
        });
    }
}
