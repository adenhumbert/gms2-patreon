/// @func				patreon_request_session_cleanup
/// @desc				Send a request to the server to destroy the session data

currentRequestType = PAH_REQUEST_TYPE.SESSION_CLEANUP;
currentRequestState = PAH_REQUEST_STATE.PENDING;

var _str = "private_hash=" + privateHash;

requestID = http_post_string(PAH_SESSION_CLEANUP_REQUEST_URL, _str);
requestCount ++;

if (PAH_DEBUG_MODE_ENABLED) show_debug_message("PatreonAuthHandler: Sending session cleanup request > " + string(requestCount));