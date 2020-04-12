/// @func				patron_auth_get_member_relationship_start
/// @desc				Returns the date/time (string) the Patron first pledged; "" if unavailable
/// @param instID		The instance ID of the PatreonAuthHandler

var _inst = argument0
var _key = "pledge_relationship_start";

return patreon_auth_get_member_attribute(_inst, _key, "");