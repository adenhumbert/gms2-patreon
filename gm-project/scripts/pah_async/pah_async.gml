/// @func				pah_async
/// @desc				Handle the async events

if (async_load[? "id"] != requestID) exit;
var _result = async_load[? "result"];

switch (currentRequestType) {
	case PAH_REQUEST_TYPE.SESSION_ID:
		pah_response_session_id(_result);
		break;
	case PAH_REQUEST_TYPE.MEMBER_INFO:
		pah_response_member_info(_result);
		break;
	case PAH_REQUEST_TYPE.SESSION_CLEANUP:
		pah_response_session_cleanup(_result);
		break;
}