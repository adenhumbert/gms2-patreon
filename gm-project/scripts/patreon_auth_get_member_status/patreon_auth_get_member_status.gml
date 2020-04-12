/// @func				patron_auth_get_member_status
/// @desc				Returns the status of the Patron. Possible values (string): "active_patron", "delcined_patron", "former_patron", ""
/// @param instID		The instance ID of the PatreonAuthHandler

var _inst = argument0
var _key = "patron_status";

return patreon_auth_get_member_attribute(_inst, _key, "");