/// @func				patreon_request_session_id
/// @desc				Send a request to the server to obtain a session ID
/// @desc				The session ID is used to identify the specific game client requesting member information

currentRequestType = PAH_REQUEST_TYPE.SESSION_ID;
currentRequestState = PAH_REQUEST_STATE.PENDING;

var _str = "private_id=" + base64_encode(string(privateID));

requestID = http_post_string(PAH_SESSION_ID_REQUEST_URL, _str);
requestCount ++;

if (PAH_DEBUG_MODE_ENABLED) show_debug_message("PatreonAuthHandler: Sending session ID request > " + string(requestCount));