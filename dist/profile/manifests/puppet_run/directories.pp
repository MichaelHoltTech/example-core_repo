#Original Code thanks to Graham Gilbert (https://github.com/grahamgilbert/puppet-puppet_run)
class profile::puppet_run::directories {

    if $::operatingsystem == "Darwin"{
        if !defined(File['/Library/Management']){
            file { '/Library/Management':
                ensure => directory,
            }
        }

        if !defined(File['/Library/Management/bin']){
            file { '/Library/Management/bin':
                ensure => directory,
            }
        }
    }

}
