/// @func				pah_update_requests
/// @desc				Handle request timeouts in the step event

// don't update if we're waiting for a response
if (requestID > 0 || currentRequestState != PAH_REQUEST_STATE.PENDING) exit;

requestTimer += delta_time * 0.000001;

var _requestDelay, _requestLimit, _requestScript;

switch(currentRequestType) {
	case PAH_REQUEST_TYPE.SESSION_ID:
		_requestDelay = PAH_SESSION_ID_REQUEST_DELAY;
		_requestLimit = PAH_SESSION_ID_REQUEST_LIMIT;
		_requestScript = pah_request_session_id;
		break;
	case PAH_REQUEST_TYPE.MEMBER_INFO:
		_requestDelay = PAH_MEMBER_INFO_REQUEST_DELAY;
		_requestLimit = PAH_MEMBER_INFO_REQUEST_LIMIT;
		_requestScript = pah_request_member_info;
		break;
	case PAH_REQUEST_TYPE.SESSION_CLEANUP:
		_requestDelay = PAH_SESSION_CLEANUP_REQUEST_DELAY;
		_requestLimit = PAH_SESSION_CLEANUP_REQUEST_LIMIT;
		_requestScript = pah_request_session_cleanup;
		break;
}

if (requestTimer >= _requestDelay) {
	
	if (requestCount >= _requestLimit) {
		currentRequestState = PAH_REQUEST_STATE.TIMEOUT;
		if (PAH_DEBUG_MODE_ENABLED) show_debug_message("PatreonAuthHandler: Request timed out");
	} else {
		requestTimer = 0;
		if (PAH_DEBUG_MODE_ENABLED) script_execute(_requestScript);
	}
	
}