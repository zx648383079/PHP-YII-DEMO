<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

use yii\helpers\Html;

//$this->title = '';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-login">
    <h1><?= Html::encode($this->title) ?></h1>

    <p>Please fill out the following fields to login:</p>


            <form action="?r=site/main" method="POST">
                <input type="hidden" name="<?=Yii::$app->getRequest()->csrfParam?>" value="<?=Yii::$app->getRequest()->getCsrfToken()?>">
                <select name="city">
                    <option value="sh">上海</option>
                    <option value="bj">北京</option>
                </select>
                <input type="text" name="name" placeholder="Name" required>
                <input type="text" name="mobile" placeholder="Mobile" required>
                <button type="submit">Submit</button> 
            </form>
        </div>
    </div>
</div>
