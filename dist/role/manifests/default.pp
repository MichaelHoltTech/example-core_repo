class role::default {
  notify {"Configuring Global Mac Settings": }
  include ::profile::puppet_run
  exec {'Hide Puppet User':
          command => "/usr/bin/defaults write /Library/Preferences/com.apple.loginwindow HiddenUsersList -array-add puppet",
  }
  exec {'Add Everyone to LP Admin':
          command => "/usr/sbin/dseditgroup -o edit -n /Local/Default -a everyone -t group lpadmin"
  }
  file { [ "/var/lib/puppet/" ]:
    ensure => "directory",
  }
}
