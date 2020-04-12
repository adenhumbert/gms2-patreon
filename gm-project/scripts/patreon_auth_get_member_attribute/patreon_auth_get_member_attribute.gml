/// @func				patreon_auth_get_member_attribute
/// @param instID		The instance ID of the PatreonAuthHandler
/// @param key			The attribute to get
/// @param default		The default value to return if the key does not exist

var _inst = argument0;
var _key = argument1;
var _val = argument2;

with (_inst) {
	if (object_index == PatreonAuthHandler) {
		if (ds_exists(memberInfo, ds_type_map)) {
			if (ds_map_exists(memberInfo, _key)) {
				_val = memberInfo[? _key];
			}
		}
	}
}

return _val;