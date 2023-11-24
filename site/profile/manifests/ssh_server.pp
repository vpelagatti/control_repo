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
    key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDP3xDNyS24hxcwinQgUpJVzzoe0424CjdyrnJf/nz34OkKY6nSNsDpGL3ocUcf7iJBhTD9mJjRHsYTdPERitmCTqpLlt1YUHpDdPTVXJwfsrd1bRDD7QV3IePtyEH3JFgmA34nCtkHauIkOyY4Rmjrfgn+6HnHS69nksF1uUBui53Y5bsX+imCl1qONNRstVoIV9aBFFDfcE6GstgaZVUi6VZ99fulumJy7h+jBmbHBFPITG2JGC4lqRukKtqneLPnezCfzdpZnRSvjajfwbFYj/sL5V9TSNoUuDDlA+mAy/JEQFHMrOA5YGcsjIp8lQ++PhKHGvG+jJOAdlazp/LF',    
  }
  
}
