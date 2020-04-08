<?php

require_once 'config/db.config.php';

// Manage the database connection
try {
	$dbh = new PDO('mysql:host=' . $dbHost . ';dbname=' . $dbName, $dbUser, $dbPass);
} catch (PDOException $e) {
    print 'Error!: ' . $e->getMessage() . '<br/>';
    die();
}

///
/// DB Operation Functions
///

function db_store_session($private_hash, $session_id) {
    
    global $dbh;
    
    $sql = 'INSERT INTO sessions (sessionID, privateHash) VALUES (?,?)';
    $sth = $dbh->prepare($sql);
    $sth->bindParam(1, $session_id, PDO::PARAM_STR);
    $sth->bindParam(2, $private_hash, PDO::PARAM_STR);

    return $sth->execute();
    
}

function db_update_session ($member_info, $session_id) {
    
    global $dbh;
    
    $sql = 'UPDATE sessions SET memberInfo=? WHERE sessionID=?';
    $sth = $dbh->prepare($sql);
    $sth->bindParam(1, $member_info, PDO::PARAM_STR);
    $sth->bindParam(2, $session_id, PDO::PARAM_STR);
    
    return ($sth->execute());
}

function db_fetch_member_info ($private_hash) {
    
    global $dbh;
    
    $sql = 'SELECT memberInfo FROM sessions WHERE privateHash=? LIMIT 1';
    $sth = $dbh->prepare($sql);
    $sth->bindParam(1, $private_hash, PDO::PARAM_STR);
    
    if ($sth->execute()) {
        
        while ($row = $sth->fetch()) {
            return $row['memberInfo'];
        }
        
        return '1';
        
    }
    
    return '-1';
    
}

function db_cleanup_session ($private_hash) {
    
    global $dbh;
    
    $sql = 'DELETE FROM sessions WHERE privateHash=?';
    $sth = $dbh->prepare($sql);
    $sth->bindParam(1, $private_hash, PDO::PARAM_STR);
    
    return ($sth->execute());
}

function db_get_session_times() {
    
    global $dbh;
    
    $sessions = array();
    
    $sql = 'SELECT sessionID,createTime FROM sessions WHERE 1';
    $sth = $dbh->prepare($sql);
    $sth->execute();
    
    while ($row = $sth->fetch()) {
        array_push($sessions, $row);
    }
    
    return $sessions;
}

function db_purge_sessions($session_ids) {
    
    global $dbh;
    
    foreach ($session_ids as $session_id) {
        $sql = 'DELETE FROM sessions WHERE sessionID=?';
        $sth = $dbh->prepare($sql);
        $sth->bindParam(1, $session_id, PDO::PARAM_STR);
        $sth->execute();
    }
    
}