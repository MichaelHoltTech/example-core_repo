#Original Code thanks to Graham Gilbert (https://github.com/grahamgilbert/puppet-puppet_run)
class profile::puppet_run (
    $server_name
){
    class {'profile::puppet_run::directories': } ->
    class {'profile::puppet_run::install': } ->
    class {'profile::puppet_run::service': }
}
