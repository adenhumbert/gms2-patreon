<?php

require_once "db.php";
require_once "config/patreon.config.php";
require_once 'API_GMS2.php';
require_once 'patreon-php/OAuth.php';
 
use Patreon\API_GMS2;
use Patreon\OAuth;

$state = $_GET['state'];
$access_token = '';
$user_id = '';
$member_info = '';

// Get OAuth token if a valid code is provided
if ( $_GET['code'] != '' ) {
	
	$oauth_client = new OAuth($client_id, $client_secret);
	$tokens = $oauth_client->get_tokens($_GET['code'], $redirect_uri);
	$access_token = $tokens['access_token'];

} else {
    echo "<p class='error'>No code available.</p>";
}

// Create API request for user data if access token is valid
if ($access_token != '') {
    $api_client = new API_GMS2($access_token);
    $patron_response = $api_client->fetch_user_memberships();
    $memberships = $patron_response["included"];
} else {
    echo "<p class='error'>Unable to get access token.</p>";
}

// Extract membership data if API request was successful
if (!empty($memberships)) {
    
    // Search user data for membership to your campaign
    foreach ($memberships as $membership) {
        $id = $membership['relationships']['campaign']['data']['id'];
        if ($id == $campaign_id) {
            $member_info = base64_encode(json_encode($membership['attributes']));
        }
    }
    
    // If found, update the session in the DB
    if ($member_info != '') {
        if (db_update_session($member_info, $state)) {
            echo "<p class='success'>Membership confirmed and submitted to server.</p>";
        } else {
            echo "<p class='error'>Membership confirmed but could not be submitted to server.</p>";
        }
    } else {
        echo "<p class='error'>You are not a member this campaign.</p>";
    }
    
} else {
    echo "<p class='error'>Unable to obtain user memberships.</p>";
}