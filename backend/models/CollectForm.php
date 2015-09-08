<?php
namespace backend\models;

use Yii;
use yii\base\Model;
use backend\models\Collect;
use yii\web\UploadedFile;

class CollectForm extends Model
{
    /**
     * @var UploadedFile[]
     */
    public $audio;

    public function rules()
    {
        return [
            [['audio'], 'file','extensions' => ['mp3','flac','m4a','ogg','wav','wma'],'maxFiles' => 100],
        ];
    }
    
    public function upload()
    {
        if ($this->validate()) { 
            foreach ($this->audio as $file) {
                
                $path = 'uploads/' . $file->name;
                $file->saveAs(iconv('utf-8','gb2312',$path));
                
                $model = new Collect();
                $model->user_id = Yii::$app->user->identity->id;
                $model->created_at = $model->updated_at = time();
                $model->audio = $path;
                $model->save();
            }
            return true;
        } else {
            return false;
        }
    }
}