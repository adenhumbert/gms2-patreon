/// @func				pah_request_type_string
/// @desc				Returns the given request type as a string
/// @param				PAH_REQUEST_TYPE

var _requestType = argument0;

switch(_requestType) {
	case PAH_REQUEST_TYPE.SESSION_ID:
		return "Session ID";
	case PAH_REQUEST_TYPE.MEMBER_INFO:
		return "Member Info";
	case PAH_REQUEST_TYPE.SESSION_CLEANUP:
		return "Session Clean Up";
	default:
		return "None";
}