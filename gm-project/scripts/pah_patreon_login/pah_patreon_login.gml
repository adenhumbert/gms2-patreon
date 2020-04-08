/// @func				pah_patreon_login
/// @desc				Open a browser window to allow athe user to login
/// @desc				Start polling the server for member info

var _url = PAH_PATREON_REQUEST_URL;
_url = string_replace(_url, "{PARAM_CLIENT_ID}", PAH_CLIENT_ID);
_url = string_replace(_url, "{PARAM_REDIRECT_URI}", PAH_REDIRECT_URI);
_url = string_replace(_url, "{PARAM_STATE}", sessionID);

url_open(_url);
pah_reset_timer();
pah_request_member_info();