<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\LinkPager;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Collects';
$this->params['breadcrumbs'][] = $this->title;
$this->params['index'] = 1;
?>
<div class="collect-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
       <a class="btn btn-success" href="/admin.php?r=collect/create">Create Collect</a> 
       <a class="btn btn-success" href="/admin.php?r=collect/view">Show Collect</a> 
    </p>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>ID</th>
                <th>Audio</th>
                <th>Text</th>
                <th>Like</th>
                <th>User Name</th>
                <th>Update Date</th>
                <th>Create Date</th>
                <th>Action</th>
            </tr>
        </thead>
        
    <?php
        foreach ($models as $value) {
            echo '<tr>';
            echo "<td>{$value['id']}</td>";
            echo "<td>{$value['audio']}</td>";
            echo "<td>{$value['text']}</td>";
            echo "<td>{$value['like']}</td>";
            echo "<td>".$value->user->username."</td>";
            echo "<td>".Yii::$app->formatter->asDatetime($value['updated_at'])."</td>";
            echo "<td>".Yii::$app->formatter->asDatetime($value['created_at'])."</td>";
            echo '<td><a class="btn btn-primary" href="/admin.php?r=collect/update&id='.$value['id'].'">编辑</a><a class="btn btn-danger" href="/admin.php?r=collect/delete&id='.$value['id'].'" data-confirm="Are you sure you want to delete this item?" data-method="post">删除</a></td>';
            echo '</tr>';
        }
    ?>
    <tr>
    <?=LinkPager::widget([
        'pagination' => $pages,
    ]);?>
    </tr>
    <table class="table table-hover">
</div>
