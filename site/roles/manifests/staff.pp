# Defines a Staff role that calls roles that all staff machines should have

class roles::staff {
  include ::profiles::dock::staff_dock

}
