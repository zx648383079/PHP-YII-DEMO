<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Collect */

$this->title = 'Update Collect: ' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Collects', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
$this->params['index'] = 1;
?>
<div class="collect-update">

    <h1><?= Html::encode($this->title) ?></h1>
    <audio src="/<?=$model->audio?>" controls="controls">
    Your browser does not support the audio element.
    </audio>
    <form method="post" action="?r=collect/update&id=<?=$model->id?>">
        <input type="hidden" name="<?=Yii::$app->getRequest()->csrfParam?>" value="<?=Yii::$app->getRequest()->getCsrfToken()?>">
        <div class="form-group">
            <label for="exampleInputPassword1">Text</label>
            <textarea class="form-control" rows="3" name="text"><?=$model->text?></textarea>
        </div>
        <p class="text-danger"><?=$error?></p>
        <div class="form-group">
            <button type="submit" class="btn btn-success">Update</button>
        </div>
    </form>

</div>
