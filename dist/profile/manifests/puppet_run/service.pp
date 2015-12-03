#Original Code thanks to Graham Gilbert (https://github.com/grahamgilbert/puppet-puppet_run)
class profile::puppet_run::service (
    $server_name = $profile::puppet_run::server_name
){
    case $operatingsystem {
        Darwin:{
            service { 'com.grahamgilbert.puppet_run':
                ensure  => 'running',
                enable  => 'true',
            }
        }

        Ubuntu:{
            service {'puppet':
                ensure  => running,
            }
        }
    }
}
