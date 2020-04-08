/// @func				patreon_request_member_info
/// @desc				Send a request to the server get member info

currentRequestType = PAH_REQUEST_TYPE.MEMBER_INFO;
currentRequestState = PAH_REQUEST_STATE.PENDING;

var _str = "private_hash="+privateHash;
requestID = http_post_string(PAH_MEMBER_INFO_REQUEST_URL, _str);
requestCount ++;

if (PAH_DEBUG_MODE_ENABLED) show_debug_message("PatreonAuthHandler: Sending member info request > " + string(requestCount));