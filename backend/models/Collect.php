<?php

namespace backend\models;

use Yii;
use common\models\User;
/**
 * This is the model class for table "collect".
 *
 * @property integer $id
 * @property string $audio
 * @property string $text
 * @property integer $like
 * @property integer $user_id
 * @property integer $created_at
 * @property integer $updated_at
 */
class Collect extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'collect';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['like', 'user_id', 'created_at', 'updated_at'], 'integer'],
            [['text', 'audio'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'audio' => 'Audio',
            'text' => 'Text',
            'like' => 'Like',
            'user_id' => 'User ID',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }
    
    public function getUser()
    {
        return $this->hasOne(User::className(),['id' => 'user_id']);
    }
}
