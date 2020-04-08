/// @desc Clean up DS

if (ds_exists(ds_type_map, memberInfo)) {
	ds_map_destroy(memberInfo);	
}