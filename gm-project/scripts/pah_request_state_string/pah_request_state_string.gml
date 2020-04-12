/// @func				pah_request_state_string
/// @desc				Returns the given request state as a string
/// @param				PAH_REQUEST_STATE

var _requestState = argument0;

switch(_requestState) {
	case PAH_REQUEST_STATE.PENDING:
		return "Pending";
	case PAH_REQUEST_STATE.FAILURE:
		return "Failure";
	case PAH_REQUEST_STATE.SUCCESS:
		return "Success";
	case PAH_REQUEST_STATE.TIMEOUT:
		return "Timed out";
	default:
		return "Invalid Request State";
}