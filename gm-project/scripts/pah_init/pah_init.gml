/// @func				pah_init
/// @desc				Initialize the PatreonAuthHandler instance
/// @desc				Called from the PatreonAuthHandler create event

currentRequestType = -1;
currentRequestState = -1;

requestID = -1;

privateID = irandom(10000000);
privateHash = -1;
sessionID = -1;
memberInfo = -1;

pah_reset_timer();

if (PAH_DEBUG_MODE_ENABLED) show_debug_message("PatreonAuthHandler: Initialized");

pah_request_session_id();