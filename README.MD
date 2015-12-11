This is an example Core Repository with some additional configuration options.  I wanted to start providing additional examples for people to look at in addition to the blog post [**HERE**](http://www.mholt.tech/blog/2015/12/07/basic-puppet-configuration/).  I'm going to continue to expand this with examples as I begin to refactor our Puppet Environment next year.

This repository is best used when your computer is tagged with the computer role "development".  This can be done by running:

````
sudo mkdir -p /etc/facter/facts.d
sudo nano /etc/facter/facts.d/computer_role.yaml
````

Now Paste the following inside of `` computer_role.yaml ``

````
---
computer_role: "development"
````

This will do the following on the computer:

- Create a user named "testuser" with password "test" and uid "900" with admin privileges.
- Enable ARD Remote Management for testuser
- Enable SSH for testuser
- Apply a default dock
- Install a printer (must have HP drivers installed)
- Set a loginwindow message
- Configure puppet and automatically run it using puppet_run module
- Hide "Puppet" user
- Disable the Guest User
- Enable Fast User Switching
- Allow users to access the following settings in System Preferences:
  - Energy Saver
  - Date/Time
  - Time Machine
  - Printers
  - DVD Region Initialization
- Allow everyone access to lpadmin (allows user to un-pause printers)
