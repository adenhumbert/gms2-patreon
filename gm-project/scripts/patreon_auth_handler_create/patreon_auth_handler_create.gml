/// @func				patreon_auth_handler_create
/// @desc				Instantiate the PatreonAuthHandler and return it's ID
/// @param x			
/// @param y
/// @param layer		Can be a layerID or name

var _x = argument0;
var _y = argument1;
var _layer = argument2;

if (typeof(_layer) == "string") _layer = layer_get_id(_layer);

return instance_create_layer(_x, _y, _layer, PatreonAuthHandler);