<?php

namespace Patreon;

include "patreon-php/API.php";

class API_GMS2 extends API {
    
    public function fetch_user_memberships() {
		// Fetches details about the user's current memberships
		return $this->get_data('identity?include=memberships.campaign&fields%5Bmember%5D=currently_entitled_amount_cents,lifetime_support_cents,last_charge_status,patron_status,last_charge_date,pledge_relationship_start');
	}
	
}