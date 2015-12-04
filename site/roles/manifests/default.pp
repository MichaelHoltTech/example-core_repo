class roles::default {
    case $operatingsystem {
      Darwin:{
        include profiles::common
      }
    }
}
