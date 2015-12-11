# create user "testuser" with password test and uid 900
class profiles::users::testuser {
  include managedmac::users
  $defaults = { 'gid' => 20, }
  $accounts = {
    'testuser' => {
      'uid' => 900,
      'gid' => 80,
      'iterations' => 37593,
      'password' => '7bac89cd68f3af769e8bbcb6eee074ac8a0e633f86bd118cd10453b16e15edd3dc72176576fa57710a601e79da50619d1cd33eefae7ec96c556c29ba86336633dd2ed31d5f062684874f6be74b555f781353afc73d918ed87945f2922afba64469ddef57df6df5e40cfec9d72c4ad9e71c860ac7c990fb04edb107db99b9bf14',
      'salt' => 'd1dc31b68c52caf9a4d7dbb90570c959f40cf05ed224fd33a1004d496ef3fd3e',
      'shell' => '/bin/bash',
      'home' => '/Users/testuser'
    },
  }

  class { 'managedmac::users':
    accounts => $accounts,
    defaults => $defaults,
  }

}
