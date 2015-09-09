<?php
namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\base\DynamicModel;

/**
 * Site controller
 */
class SiteController extends Controller
{
    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    public function actionIndex()
    {
        if (Yii::$app->request->isPost) {
            return $this->redirect(['main']);
        }
        return $this->render('index');
    }
    
    public function actionMain()
    {
        if (Yii::$app->request->isPost) {
            $model = DynamicModel::validateData(Yii::$app->request->post(), [
                [['name','mobile','city'],'required'],
                ['name', 'string', 'max' => 128],
                ['mobile', 'match','pattern'=>'#^13[\d]{9}$|^14[5,7]{1}\d{8}$|^15[^4]{1}\d{8}$|^17[0,6,7,8]{1}\d{8}$|^18[\d]{9}$#','message'=>'手机号不正确！'],
                ]);
        
            if ($model->hasErrors()) {
                var_dump($model->errors);
                die;
            } else {
                // 验证成功
            }
            return $this->redirect(['success']);
        }
        return $this->render('main');
    }
    
    public function actionSuccess()
    {
        return $this->render('success');
    }
}
