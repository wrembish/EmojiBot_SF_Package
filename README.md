# EmojiBot SF Package

## Getting Started
* Clone the repo
* Setup Your Salesforce Org
  * Get you username and password so you can login to the org
* In the cloned repo, Authorize to your org
* Using the included Package.xml, push the code to your org
* Go to setup > Search for "App Manager" > Go to "App Manager"
* Find the "Discord Integration" Connected App, click the drop down, and click "View"
* Click "Manage Consumer Details" to get your Key and Secret
* To setup your Discord Integration user, go to Setup > Users > "New"
* Assign the user the "Discord Integration" Profile
  * The rest of the information is up to you
* Create a password for the user and login as the user
* Go to Settings > My Settings > Reset my Security Token

## Importing Conversion Map (Characters and Emojis)
* open dataloader and log into your org created above with either your admin user, or as the discord integration user you created
* Click "Insert" and select Characters
* Select the included Characters.csv in the ImportCsvFiles Directory and click through to the mapping
* You can either manually create the mapping, or use the included mapping file
* Finish the import
* Now select Upsert and the included Emojis.csv
* Use External_Id__c ad the referenced field for all of the match field selections
* Use the included Emojis-mapping file for the mapping, or manually create it
* Finish the Upsert

## Useful Commands
* sfdx force:source:deploy -x manifest/package.xml
