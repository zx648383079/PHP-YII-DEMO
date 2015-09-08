<?php

/* @var $this \yii\web\View */
/* @var $content string */

use backend\assets\AppAsset;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use common\widgets\Alert;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
    <nav id="w0" class="navbar-inverse navbar-fixed-top navbar" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#w0-collapse"><span class="sr-only">Toggle navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a class="navbar-brand" href="/admin.php">NWAYS</a></div>
<div id="w0-collapse" class="collapse navbar-collapse">
    <ul id="w1" class="navbar-nav navbar-right nav">
        <?php if(Yii::$app->user->isGuest){
            echo '<li class="active"><a href="/admin.php?r=site/login">Login</a></li>';
        }else{
            echo '<li class="'.(($this->params['index']==0)?'active':'').'"><a href="/admin.php?r=site/index">Home</a></li>';
            echo '<li class="'.(($this->params['index']==1)?'active':'').'"><a href="/admin.php?r=collect/index">Collect</a></li>';
            echo '<li class="'.(($this->params['index']==2)?'active':'').'"><a href="/admin.php?r=site/reset">Password</a></li>';
            echo '<li><a href="/admin.php?r=site/logout" data-method="post">Logout ('.Yii::$app->user->identity->username.')</a></li>';
       } ?>
    </ul>
   </div>
  </div>
</nav>


    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= Alert::widget() ?>
        <?= $content ?>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; NWAYS <?= date('Y') ?></p>

        <p class="pull-right"><?= Yii::powered() ?></p>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
