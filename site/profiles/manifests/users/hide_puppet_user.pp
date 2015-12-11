#Automatically hide the Puppet user that is created by Puppet
class profiles::users::hide_puppet_user {
  exec {
    'Hide Puppet User':
    command => "/usr/bin/defaults write /Library/Preferences/com.apple.loginwindow HiddenUsersList -array-add puppet",
  }
}
