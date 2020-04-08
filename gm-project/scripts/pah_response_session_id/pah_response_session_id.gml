/// @func				pah_response_session_id
/// @desc				Handle the response from the session ID request

var _result = argument0;

switch (_result) {
	case undefined:
	case "":
		if (PAH_DEBUG_MODE_ENABLED) show_debug_message("PatreonAuthHandler: Session ID > Empty response");
		requestID = -1;
		break;
	case "-1":
		if (PAH_DEBUG_MODE_ENABLED) show_debug_message("PatreonAuthHandler: Session ID > Failure");
		currentRequestState = PAH_REQUEST_STATE.FAILURE;
		requestID = -1;
		break;
	default:
		pah_reset_timer();
		requestID = -1;
		sessionID = _result;
		privateHash = md5_string_utf8(string(privateID) + sessionID);
		if (PAH_DEBUG_MODE_ENABLED) show_debug_message("PatreonAuthHandler: Session ID > " + sessionID);
		if (PAH_DEBUG_MODE_ENABLED) show_debug_message("PatreonAuthHandler: Private Hash > " + privateHash);
		pah_patreon_login();
		break;
}
