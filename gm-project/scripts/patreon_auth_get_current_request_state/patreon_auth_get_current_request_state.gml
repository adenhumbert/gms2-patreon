/// @func				patreon_auth_get_current_request_state
/// @desc				Returns the PAH_REQUEST_STATE of the PatreonAuthHandler
/// @param instID		The instance ID of the PatreonAuthHandler

var _inst = argument0

with (_inst) {
	if (object_index == PatreonAuthHandler) {
		return currentRequestState;	
	}
}

return -1;