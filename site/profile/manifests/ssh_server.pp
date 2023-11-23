class profile::ssh_server {
  package { 
   'openssh-server':
       ensure => present,
  }
  
  service {
    'ssh':
      ensure => 'running',
      enable => 'true',
  }

  ssh_authorized_key { 'root@puppet':
    ensure => present,
    user => 'root',
    type => 'ssh-rsa',
    key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDP3xDNyS24hxcwinQgUpJVzzoe0424CjdyrnJf/nz34OkKY6nSNsDpGL3ocUcf7iJBhTD9mJjRHsYTdPERitmCTqpLlt1YUHpDdPTVXJwfsrd1bRDD7QV3IePtyEH3JFgmA34nCtkHauIkOyY4Rmjrfgn+6HnHS69nksF1uUBui53Y5bsX+imCl1qONNRstVoIV9aBFFDfcE6GstgaZVUi6VZ99fulumJy7h+jBmbHBFPITG2JGC4lqRukKtqneLPnezCfzdpZnRSvjajfwbFYj/sL5V9TSNoUuDDlA+mAy/JEQFHMrOA5YGcsjIp8lQ++PhKHGvG+jJOAdlazp/LF',
  }
}
