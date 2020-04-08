/// @func				pah_response_member_info
/// @desc				Handle the response from the member info request

var _result = argument0;

switch (_result) {
	case undefined:
	case "":
		if (PAH_DEBUG_MODE_ENABLED) show_debug_message("PatreonAuthHandler: Member Info > Empty response");
		requestID = -1;
		break;
	case "-1":
		if (PAH_DEBUG_MODE_ENABLED) show_debug_message("PatreonAuthHandler: Member Info > Failure");
		currentRequestState = PAH_REQUEST_STATE.FAILURE;
		requestID = -1;
		break;
	default:
		currentRequestState = PAH_REQUEST_STATE.SUCCESS;
		pah_reset_timer();
		requestID = -1;
		var _memberJSON = base64_decode(_result)
		memberInfo = json_decode(base64_decode(_memberJSON));
		if (PAH_DEBUG_MODE_ENABLED) show_debug_message("PatreonAuthHandler: Member Info > " + _memberJSON);
		pah_request_session_cleanup();
		break;
}
