<?php
    if (!defined("APP_RUNNING")) die()
?>

<h2 class="ui dividing header">
    <div style="display: flex; justify-content: left">
        <i class="plus icon"></i>Post a new task
    </div>
</h2>

<form class="ui form">
    <h4 class="ui dividing header">Task description</h4>

    <div class="field">
        <label>Category</label>
        <input type="text" placeholder="Category" id="post-task-category"/>
    </div>

    <div class="field">
        <label>Detailed description</label>
        <input type="text" placeholder="Detailed description" id="post-task-description"/>
    </div>

    <h4 class="ui dividing header">Time and venue</h4>

    <div class="three fields">
        <div class="field">
            <label>Date</label>
            <input type="date" placeholder="Date" id="post-task-date"/>
        </div>
        <div class="field">
            <label>From</label>
            <input type="time" placeholder="From" id="post-task-timestart"/>
        </div>
        <div class="field">
            <label>To</label>
            <input type="time" placeholder="To" id="post-task-timeend"/>
        </div>
    </div>

    <div class="field">
        <label>Address</label>
        <input type="text" placeholder="Address" id="post-task-address"/>
    </div>

    <h4 class="ui dividing header">Photos <i>(optional)</i></h4>
</form>

<div style="display: flex; justify-content: center">
    <button class="ui button teal" id="post-task-submit-button">Submit</button>
</div>
