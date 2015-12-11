# Defines a Location role that calls configuration profiles that
# should be applied to all machines tagged to this location
class roles::location::valencia_campus {

  #Install Admin Printer
  include ::profiles::printers::valencia_campus::admin

}
