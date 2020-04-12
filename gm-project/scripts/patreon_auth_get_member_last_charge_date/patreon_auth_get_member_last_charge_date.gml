/// @func				patron_auth_get_member_last_charge_date
/// @desc				Returns the last date/time (string) the member was charged; "" if unavailable
/// @param instID		The instance ID of the PatreonAuthHandler

var _inst = argument0
var _key = "last_charge_date";

return patreon_auth_get_member_attribute(_inst, _key, "");