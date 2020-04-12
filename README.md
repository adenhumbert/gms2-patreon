## Introduction

This project provides a basic framework to start integrating a GameMaker Studio 2 project with the Patreon API. As is, the included code will allow you to:

1. Request a user to login in to Patreon and grant you permission to view their public profile information
2. Verify the user is a member of your Patreon campaign
3. Retreive details about the user's membership in GMS2 as a ds_map

**Requirements**

1. A webserver that supports PHP/mySQL
2. A Patreon Creator account
3. GameMaker Studio 2

## Setup

**1. Server (Part A)**

1. Create a database and user with read/write permissions
2. Create the sessions table as provided in "other/sessions.sql"
3. Copy the contents of the "server" directory to the desired location on your server
4. Make note of the fully qualified URI for the "auth.php" file (eg. If you uploaded to "public_html/patreon/" your URI would be something like "https://youresite.com/patreon/auth.php")
5. Edit the "config/db.config.php" files with information for the database and user you created in step 1
6. Setup a cronjob to run "purge.php" as often as needed. This script clears any sessions from the database older than 5 minutes.

**2. Patreon app**

1. Login to your creator account and navigat to patreon.com/portal
2. Click "Clients & API Keys" in the top-right corner
3. From the "My Clients" tab, click "Create Client"
4. Fill in the basic information as needed (note this project does not provide a Privacy Policy or Terms of Service)
5. For "Redirect URIs" include the URI for the "auth.php"
6. For API Version, select "2"
7. Once created, expand your client application in the menu. You will need the Client ID and Client Secret later.
8. Obtain your Patreon campaign ID (https://www.patreondevelopers.com/t/campaign-id-place/68/4)

**3. Server (Part B)**

1. Update the "config/patreon.config.php" file with the information obtained from 1.4, 2.7, and 2.8 

**4. GameMaker Project**

1. In the GameMaker project, open up the script titled "patreon_auth_constants"
2. Update PAH_CLIENT_ID with your Client ID from 2.7
3. Update PAH_SERVER_SCRIPTS_DIR with the location you uploaded the contents of the server directory to (eg. "https://mysite.com/patreon")
4. Modify the other values to suit your needs

## Communications Flow and Data Tracking

1. GameMaker generates a random number secretID and uses this to send a sessionID request to your server. The secretID is never publicly exposed.
2. Your server generates a sessionID, and uses it and the secretID to create the secretHash. The sessionID will be publicly exposed. The sessionID and secretHash will be temporarily stored in the database.
3. Your server reponds to GameMaker with the sessionID request with the sessionID and secretHash.
4. GameMaker begins polling your server to see if there is member information associated with the secretHash obtained. 
5. GamerMaker opens up a browser window with the Patreon login window to request your application to get permission to the user's public profile info. The sessionID is publicly exposed in this URL.
5. When the user logs in and verifies permissions, Patreon redirects the user to your "auth.php" script on the server and passes a one-time use code.
6. This code is used by the server to request an OAuth token from Patreon for the user with the permissions to retrieve their public profile info.
7. The server uses the OAuth code query the Patreon API for their profile and checks to see if they are a member of your campaign.
8. If so, it encodes only the information about the membership and stores this in the database in the session associated with the sessionID.
9. GameMaker finds the memberInfo in the database, stores it in a ds_map, and sends a request to the server to destroy the session.
10. The server attempts to destroy the session and responds to GameMaker with the result.

**Notes**

* The information in the database is encoded but not encrypted.
* No personally identifying information is stored in the database at any time.
* The sessions are never meant to be stored in the database for more than a few minutes at a time.

## Usage in GameMaker

1. Instantiate the **PatreonAuthHandler** using the *patreon_auth_handler_create* script. It returns the ID of the instance created, needed for the *patreon_auth_get_** scripts.
2. Use *patreon_auth_get_request_type* and *patreon_auth_get_request_state* to determine the status of the current request (the possible return types are defined in *patreon_auth_contants*).
3. *patreon_auth_get_member_map* will return the ID of the map, or -1 if it's unavailable. This map is destroyed in the Clean Up event of the PatreonAuthHandler object, so copy it if you need it to stick around.
4. You can also use the *patreon_auth_get_member_* scripts to retreive specific information from the map without needing to worry about providing the string-based keys.
