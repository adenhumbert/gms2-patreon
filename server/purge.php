<?php

require_once 'db.php';

$sessions = db_get_session_times();
$session_ids_to_purge = array();

date_default_timezone_set("America/Indiana/Indianapolis");
$time = date('Y-m-d H:m:s');

foreach ($sessions as $session) {
    if (strtotime($time) - strtotime($session['createTime']) > 300) {
        array_push($session_ids_to_purge, $session['sessionID']);
    }
}

db_purge_sessions($session_ids_to_purge);