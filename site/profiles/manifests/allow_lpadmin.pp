# This will allow ALL users access to lpadmin
class profiles::allow_lpadmin {
  exec {'Add Everyone to LP Admin':
    command => "/usr/sbin/dseditgroup -o edit -n /Local/Default -a everyone -t group lpadmin"
  }
}
