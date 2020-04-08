<?php

require_once 'db.php';

// init session
clear_session();
session_start();

$private_hash = private_hash();

if (db_store_session($private_hash, session_id())) {
    echo session_id();
} else {
    echo '-1';
}

// clean up
clear_session();

///
/// Local Functions
///

function private_hash() {
    
    global $_POST;
    
    if ($_POST['private_id'] == '') {
        echo -1;
        exit;
    }
    
    $private_id = base64_decode($_POST['private_id']);
    
    return md5( $private_id . session_id() );
    
}

function clear_session() {
    if (isset($GLOBALS['_SESSION'])) {
        session_unset();
        session_destroy();
    }
}