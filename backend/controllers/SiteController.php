<?php
namespace backend\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use common\models\LoginForm;
use common\models\User;
use yii\filters\VerbFilter;

/**
 * Site controller
 */
class SiteController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['login', 'error'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                    [
                        'actions' => ['reset','index'],
                        'allow' => true,
                        'matchCallback' => function()
                        {
                            return (!Yii::$app->user->isGuest && Yii::$app->user->identity->level == 99);
                        },             //使用方法判断
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }
    

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
        return $this->render('index');
    }
    
    public function actionReset()
    {
        $error = '';
        if(!empty(Yii::$app->request->post()))
        {
            $oldpwd = Yii::$app->request->post('oldpwd');
            $newpwd = Yii::$app->request->post('newpwd');
            $confirm = Yii::$app->request->post('confirm');
            
            $error = 'Some error is happen!';
            if(Yii::$app->user->identity->validatePassword($oldpwd) && $newpwd === $confirm)
            {
                $user = Yii::$app->user->identity;
                $user->setPassword($newpwd);
                $user->updated_at = time();
                $user->save();
                $error = 'Reset password sucesss!';
            }
        };
        return $this->render('password',['error' => $error]);
    }

    public function actionLogin()
    {
        if (!\Yii::$app->user->isGuest) {
            return $this->goHome();
        }
        
        $model = new LoginForm();
        
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        } else {
            $error = '';
            if(!empty($model->errors))
            {
                foreach ($model->errors as $value) {
                    foreach ($value as $val) {
                        $error .= $val;
                    }
                }
            }
            var_dump($model->errors);
            return $this->render('login', [
                'model' => $model,
                'error' => $error
            ]);
        }
    }

    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }
}
