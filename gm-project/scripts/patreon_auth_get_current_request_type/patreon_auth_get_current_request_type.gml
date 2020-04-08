/// @func				patreon_auth_get_current_request_type
/// @desc				Returns the PAH_REQUEST_TYPE of the PatreonAuthHandler
/// @param instID		The instance ID of the PatreonAuthHandler

var _inst = argument0

with (_inst) {
	if (object_index == PatreonAuthHandler) {
		return currentRequestType;	
	}
}

return -1;