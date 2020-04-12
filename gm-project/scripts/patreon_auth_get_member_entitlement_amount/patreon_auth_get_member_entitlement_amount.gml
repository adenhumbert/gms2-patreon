/// @func				patron_auth_get_member_entitlement_amount
/// @desc				Returns the amount in cents (real) the Patron last paid; -1 if unavailabe
/// @param instID		The instance ID of the PatreonAuthHandler

var _inst = argument0
var _key = "currently_entitled_amount_cents";

return patreon_auth_get_member_attribute(_inst, _key, -1);