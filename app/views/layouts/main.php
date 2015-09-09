<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title>Martell 300 Year Anniversary</title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
    <nav id="w0" class="navbar-inverse navbar-fixed-top navbar" role="navigation">
        <div class="container">
            <div class="navbar-header">
                
<a class="navbar-brand" href="/">NWAYS</a></div>
<div id="w0-collapse" class="collapse navbar-collapse">
    <ul id="w1" class="navbar-nav navbar-right nav">
        
    </ul>
   </div>
  </div>
</nav>

<?php echo $content; ?>



<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
