node default {
}

node /^puppet/ {
  include role::master_server
  file { '/root/FQDN':
    ensure => file,
    content => "Welcome to ${fqdn}\n",
  }
}

node /^web/ {
  include role::app_server
}

node /^db/ {
  include role::db_server
}
