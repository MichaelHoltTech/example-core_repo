#Original Code thanks to Graham Gilbert (https://github.com/grahamgilbert/puppet-puppet_run)
class profile::puppet_run::install (
    $server_name = $profile::puppet_run::server_name
){
    case $operatingsystem {
        Darwin:{

            file { mac_puppet_conf:
                path    => "/etc/puppet/puppet.conf",
                owner   => root,
                group   => wheel,
                mode    => 644,
                ensure  => present,
                content => template("profile/puppet_run/mac_puppet_conf.erb"),
            }


            file {'/Library/LaunchDaemons/com.grahamgilbert.puppet_run.plist':
                owner   => root,
                group   => wheel,
                mode    => 644,
                ensure  => present,
                source  => 'puppet:///modules/profile/puppet_run/com.grahamgilbert.puppet_run.plist',
                notify  => Exec['load_puppet_run'],
            }

            file {'/Library/Management/bin/puppet_run.py':
                owner   => root,
                group   => wheel,
                mode    => 755,
                ensure  => present,
                source  => 'puppet:///modules/profile/puppet_run/puppet_run.py',
            }

            exec {'load_puppet_run':
                command     => '/bin/launchctl -w load /Library/LaunchDaemons/com.grahamgilbert.puppet_run.plist',
                refreshonly => true,
            }

        }

        Ubuntu:{
            $default_content = '# Defaults for puppet - sourced by /etc/init.d/puppet

# Enable puppet agent service?
# Setting this to "yes" allows the puppet agent service to run.
# Setting this to "no" keeps the puppet agent service from running.
START=yes

# Startup options
DAEMON_OPTS=""
'
            file {'/etc/default/puppet':
                content => $default_content,
                owner   => 0,
                group   => 0,
                mode    => 0644,
            }
        }

    }

}
