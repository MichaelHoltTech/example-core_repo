# Configure dock for Staff role
class profiles::dock::staff_dock {
  file {"/usr/local/bin/dockutil":
    source => 'puppet:///modules/profiles/dock/dockutil',
    owner  => 0,
    group  => 0,
    mode   => '0755',
  }
  outset::login_once{'staff_dock.sh':
      ensure   => present
      script   => 'puppet:///modules/profiles/dock/staff_dock.sh',
      priority => 20,
  }
}
