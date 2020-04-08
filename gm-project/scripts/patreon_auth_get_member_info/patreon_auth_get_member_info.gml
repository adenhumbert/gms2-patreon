/// @func				patreon_auth_get_member_info
/// @desc				Returns the ID of the map containing member info from the PatreonAuthHandler
/// @param instID		The instance ID of the PatreonAuthHandler

var _inst = argument0

with (_inst) {
	if (object_index == PatreonAuthHandler) {
		return memberInfo;	
	}
}

return -1;