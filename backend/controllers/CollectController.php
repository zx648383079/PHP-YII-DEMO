<?php

namespace backend\controllers;

use Yii;
use yii\filters\AccessControl;
use backend\models\Collect;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\UploadedFile;
use backend\models\CollectForm;
use yii\data\Pagination;
/**
 * CollectController implements the CRUD actions for Collect model.
 */
class CollectController extends Controller
{
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    ['actions' => ['index','view','delete','create','update'],
                        'allow' => true,
                        'matchCallback' => function()
                        {
                            return (!Yii::$app->user->isGuest && Yii::$app->user->identity->level == 99);
                        },              //使用方法判断
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
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
    
    /**
     * Lists all Collect models.
     * @return mixed
     */
    public function actionIndex()
    {
        $query = Collect::find();
        $countQuery = clone $query;
        $pages = new Pagination(['totalCount' => $countQuery->count()]);
        $models = $query->offset($pages->offset)
            ->limit($pages->limit)
            ->with('user')->all();
    
        return $this->render('index', [
            'models' => $models,
            'pages' => $pages,
        ]);
    }

    /**
     * Displays a single Collect model.
     * @param integer $id
     * @return mixed
     */
    public function actionView()
    {
        return $this->render('view');
    }

    /**
     * Creates a new Collect model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $error = '';
        $collect = new CollectForm();
        
        if (Yii::$app->request->isPost) {
            $collect->audio = UploadedFile::getInstances($collect, 'audio');
            if ($collect->upload()) {
                $error = 'Upload success!';
            }else{
                $error = $collect ->errors['audio'][0];
            }
        }
        
        return $this->render('create', [
                'error' => $error,
            ]);
    }

    /**
     * Updates an existing Collect model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $error = '';
        $model = $this->findModel($id);
        if (Yii::$app->request->isPost) {
            $model->user_id = Yii::$app->user->identity->id;
            $model->text = Yii::$app->request->post('text');
            $model->updated_at = time();
            if($model->save()){
                return $this->redirect(['view', 'id' => $model->id]);
            }else{
                $error = 'Update fail!';
            }
        } 
        
        return $this->render('update', [
            'model' => $model,
            'error' => $error
            
        ]);
    }

    /**
     * Deletes an existing Collect model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Collect model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Collect the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Collect::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
