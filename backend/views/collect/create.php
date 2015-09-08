<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Collect */

$this->title = 'Create Collect';
$this->params['breadcrumbs'][] = ['label' => 'Collects', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$this->params['index'] = 1;
?>
<div class="collect-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <form method="post" action="?r=collect/create" enctype="multipart/form-data">
        <input type="hidden" name="<?=Yii::$app->getRequest()->csrfParam?>" value="<?=Yii::$app->getRequest()->getCsrfToken()?>">
        <div class="form-group">
            <label for="exampleInputPassword1">Audio</label>
            <input type="file" name="CollectForm[audio][]" multiple accept="audio/*">
        </div>
        <p class="text-danger"><?=$error?></p>
        <div class="form-group">
            <button type="submit" class="btn btn-success">Create</button>
        </div>
    </form>

</div>
