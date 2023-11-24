class profile::ssh_server {
  $ssh_key_hosts = [ 'root@puppet', 'root@puppet.home' ]
  
  package { 
   'openssh-server':
       ensure => present,
  }
  
  service {
    'sshd':
      ensure => 'running',
      enable => 'true',
  }

  ssh_authorized_key { $ssh_key_hosts: 
    ensure => present,
    user => 'root',
    type => $facts['ssh']['rsa']['type'],
    key  => $facts['ssh']['rsa']['key'],
  }
  
}
