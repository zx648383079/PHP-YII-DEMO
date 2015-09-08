<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

use yii\helpers\Html;

$this->title = 'Login';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-login">
    <h1><?= Html::encode($this->title) ?></h1>

    <p>Please fill out the following fields to login:</p>

    <div class="row">
        <div class="col-lg-5">
            <form action="?r=site/login" method="POST">
                <input type="hidden" name="<?=Yii::$app->getRequest()->csrfParam?>" value="<?=Yii::$app->getRequest()->getCsrfToken()?>">
                <div class="form-group">
                    <label for="exampleInputPassword1">Name</label>
                    <input type="text" name="LoginForm[username]" class="form-control" id="exampleInputPassword1" placeholder="Name" required>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" name="LoginForm[password]" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                </div>
                <div class="form-group">
                    <label>
                    <input type="checkbox" id="loginform-rememberme" name="LoginForm[rememberMe]" value="1" checked>
                    Remember Me
                    </label>
                </div>
                <p class="text-danger"><?=$error?></p>
                <button type="submit" class="btn btn-primary" name="login-button">Login</button> 
            </form>
        </div>
    </div>
</div>
