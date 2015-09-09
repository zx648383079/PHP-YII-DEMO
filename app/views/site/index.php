<?php

/* @var $this yii\web\View */
//$this->title = 'Backend';
?>
<div class="site-index">
    <form method="post">
        <input type="hidden" name="<?=Yii::$app->getRequest()->csrfParam?>" value="<?=Yii::$app->getRequest()->getCsrfToken()?>">
        <select name="year">
            <option value="1993">1993</option>
            <option value="1994">1994</option>
        </select>
        <button type="submit">Submit</button>
    </form>
</div>
