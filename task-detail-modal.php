<?php
    if (!defined("APP_RUNNING")) die()
?>

<div class="ui modal" id="task-detail-modal">
    <div class="header">
        Task details
    </div>
    <div class="content" style="display: flex">
        <div style="flex: 1">
            <h4 class="ui header">Description</h4>
            <p id="task-detail-description"></p>
            <h4 class="ui header">Category</h4>
            <p id="task-detail-category"></p>
            <h4>Date and time</h4>
            <p id="task-detail-date-and-time"></p>
            <h4>Address</h4>
            <p id="task-detail-address"></p>
        </div>
        <div style="display: flex; flex-direction: column; align-items: center; justify-content: center">
            <h3>Bid for this task</h3>
            <div class="ui input" style="margin-bottom: 10px">
                <input type="number" step="0.01" id="bid-price-input"/>
            </div>
            <button class="ui button teal small" id="bid-button">Bid</button>
        </div>
    </div>
</div>