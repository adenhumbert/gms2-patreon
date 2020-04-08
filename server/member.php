<?php

require_once 'db.php';

if (!isset($_POST['private_hash'])) {
    exit;
}

echo db_fetch_member_info($_POST['private_hash']);