/// @func				patron_auth_get_member_lifetime_amount
/// @desc				Returns the amount in cents (real) the Patron has contributed over the course of their membership; -1 if unavailable
/// @param instID		The instance ID of the PatreonAuthHandler

var _inst = argument0
var _key = "lifetime_support_cents";

return patreon_auth_get_member_attribute(_inst, _key, -1);