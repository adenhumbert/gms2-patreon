var _requestString = pah_request_type_string(patreon_auth_get_current_request_type(patreonObj));
var _stateString = pah_request_state_string(patreon_auth_get_current_request_state(patreonObj));

draw_text(0, 10, "Current Request: " + _requestString); 
draw_text(0, 30, "Request Status: " + _stateString); 

var _memberMap = patreon_auth_get_member_map(patreonObj);
if	(_memberMap > -1) {
	
		draw_text(480, 10, "Entitlement Amount: " 
			+ string_format(patreon_auth_get_member_entitlement_amount(patreonObj) / 100, 4, 2));

		draw_text(480, 30, "Lifetime Amount: " 
			+ string_format(patreon_auth_get_member_lifetime_amount(patreonObj) / 100, 4, 2));
			
		draw_text(480, 50, "Last Charge Status: " 
			+ patreon_auth_get_member_last_charge_status(patreonObj));
			
		draw_text(480, 70, "Last Charge Date: " 
			+ patreon_auth_get_member_last_charge_date(patreonObj));
			
		draw_text(480, 90, "Patron Status: " 
			+ patreon_auth_get_member_status(patreonObj));
			
		draw_text(480, 110, "Relationship Start: " 
			+ patreon_auth_get_member_relationship_start(patreonObj));

}