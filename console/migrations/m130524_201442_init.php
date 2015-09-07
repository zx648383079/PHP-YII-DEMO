<?php

use yii\db\Schema;
use yii\db\Migration;

class m130524_201442_init extends Migration
{
    public function up()
    {
        $tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            // http://stackoverflow.com/questions/766809/whats-the-difference-between-utf8-general-ci-and-utf8-unicode-ci
            $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';
        }

        $this->createTable('{{%user}}', [
            'id' => $this->primaryKey(),
            'openid' => $this->string(),
            'username' => $this->string()->unique(),
            'password_hash' => $this->string(),
            'email' => $this->string()->unique(),
            'auth_key' => $this->string(32)->unique(),
            'level' => $this->integer()->defaultValue(1),
            
            //'password_reset_token' => $this->string()->unique(),
            

            'status' => $this->smallInteger()->defaultValue(10),
            'created_at' => $this->integer()->notNull(),
            'updated_at' => $this->integer()->notNull(),
        ], $tableOptions);
    }

    public function down()
    {
        $this->dropTable('{{%user}}');
    }
}
