<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

use yii\helpers\Html;

$this->title = 'Reset Password';
$this->params['breadcrumbs'][] = $this->title;
$this->params['index'] = 2;
?>
<div class="site-password">
    <h1><?= Html::encode($this->title) ?></h1>

    <div class="row">
        <div class="col-lg-5">
            <form action="?r=site/reset" method="POST">
                <input type="hidden" name="<?=Yii::$app->getRequest()->csrfParam?>" value="<?=Yii::$app->getRequest()->getCsrfToken()?>">
                <div class="form-group">
                    <label for="exampleInputPassword1">Old Password</label>
                    <input type="password" name="oldpwd" class="form-control" id="exampleInputPassword1" placeholder="Old Password">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">New Password</label>
                    <input type="password" name="newpwd" class="form-control" id="exampleInputPassword1" placeholder="New Password">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Confirm Password</label>
                    <input type="password" name="confirm" class="form-control" id="exampleInputPassword1" placeholder="Confirm Password">
                </div>
                <p class="text-danger"><?=$error?></p>
                <button type="submit" class="btn btn-primary">Reset</button>
            </form>
        </div>
    </div>
</div>
