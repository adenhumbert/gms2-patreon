/// @func				pah_response_session_cleanup
/// @desc				Handle the response from the session cleanup request

var _result = argument0;

switch (_result) {
	case undefined:
	case "":
		if (PAH_DEBUG_MODE_ENABLED) show_debug_message("PatreonAuthHandler: Session cleanup > Empty response");
		requestID = -1;
		break;
	case "-1":
		if (PAH_DEBUG_MODE_ENABLED) show_debug_message("PatreonAuthHandler: Session cleanup > Failure");
		currentRequestState = PAH_REQUEST_STATE.FAILURE;
		requestID = -1;
		break;
	default:
		pah_reset_timer();
		requestID = -1;
		sessionID = _result;
		currentRequestState = PAH_REQUEST_STATE.SUCCESS;
		if (PAH_DEBUG_MODE_ENABLED) show_debug_message("PatreonAuthHandler: Session cleanup > Success");
		break;
}
