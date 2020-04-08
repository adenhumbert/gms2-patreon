<?php

require_once 'db.php';

if (!isset($_POST['private_hash'])) {
    exit;
}

if (db_cleanup_session($_POST['private_hash'])) {
    echo "1";
} else {
    echo "-1";
}