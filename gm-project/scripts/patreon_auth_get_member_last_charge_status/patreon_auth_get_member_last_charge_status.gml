/// @func				patron_auth_get_member_last_charge_status
/// @desc				Returns the payment status of the Patron. Possible values (string): "Paid", "Declined", "Deleted", "Pending", "Refunded", "Fraud", "Other", ""
/// @param instID		The instance ID of the PatreonAuthHandler

var _inst = argument0
var _key = "last_charge_status";

return patreon_auth_get_member_attribute(_inst, _key, "");