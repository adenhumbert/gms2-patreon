/// @func			patreon_auth_globals
/// @param			Define global references used by the PatreonAuth system

#region ENUMS

// Valid request types for PatreonAuthHandler
enum PAH_REQUEST_TYPE {
	SESSION_ID,
	MEMBER_INFO,
	SESSION_CLEANUP
}

// Valid request states for PatreonAuthHandler
enum PAH_REQUEST_STATE {
	PENDING,
	SUCCESS,
	FAILURE,
	TIMEOUT
}

#endregion

#region MACROS - DO NOT MODIFY

// The URL used ask the user to login to Patreon
#macro PAH_PATREON_REQUEST_URL			"https://www.patreon.com/oauth2/authorize?response_type=code&client_id={PARAM_CLIENT_ID}&redirect_uri={PARAM_REDIRECT_URI}&state={PARAM_STATE}"

#endregion

#region MACROS - MAY NEED MODIFICATION

// Set this to the client_id for your Patreon app
#macro PAH_CLIENT_ID					"YOUR_CLIENT_ID" 

// The URL that points to the directory containing your server scripts
#macro PAH_SERVER_SCRIPTS_DIR			"https://your.site/patreon/"

// The full URI for the script that handles authorization requests
// This URI must be present in the "Redirect URIs" in the settings for your Patreon app
#macro PAH_REDIRECT_URI					(PAH_SERVER_SCRIPTS_DIR + "auth.php")

// The full URL for the script that handles session requests from your game
#macro PAH_SESSION_ID_REQUEST_URL		(PAH_SERVER_SCRIPTS_DIR + "get_session.php")

// The full URL for the script that handles member info requests from your game
#macro PAH_MEMBER_INFO_REQUEST_URL		(PAH_SERVER_SCRIPTS_DIR + "member.php")

// The full URL for the script that handles session cleanup request from your game
#macro PAH_SESSION_CLEANUP_REQUEST_URL	(PAH_SERVER_SCRIPTS_DIR + "cleanup.php")

// The maximum number of times your game will attempt to request a session ID from your server
#macro PAH_SESSION_ID_REQUEST_LIMIT				5

// The number of seconds to wait before reattempting a request for a session ID from your server
#macro PAH_SESSION_ID_REQUEST_DELAY				5

// The maximum number of times your game will attempt to request user information
#macro PAH_MEMBER_INFO_REQUEST_LIMIT			100

// The number of seconds to wait before reattempting a request for user information
#macro PAH_MEMBER_INFO_REQUEST_DELAY			5

// The maximum number of times your game will attempt to request a session cleanup from your server
#macro PAH_SESSION_CLEANUP_REQUEST_LIMIT		5

// The number of seconds to wait before reattempting a request for a session cleanup from your server
#macro PAH_SESSION_CLEANUP_REQUEST_DELAY		5

// If true, debug message will be printed to the console
// Disable this before building a public release of your game
#macro PAH_DEBUG_MODE_ENABLED					true

#endregion