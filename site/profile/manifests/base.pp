class profile::base (
  #$ntp_servers = [
  #  '0.ubuntu.pool.ntp.org',
  #  '1.ubuntu.pool.ntp.org',
  #]
  Array $ntp_servers,
) {
  include ::ssh
  class { '::ntp':
    servers => $ntp_servers,
  }
  if $facts['os']['family'] == 'RedHat' {
    include ::profile::selinux
  }


}
