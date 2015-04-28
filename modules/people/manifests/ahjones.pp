class people::ahjones {
  package {[ 
    "pstree",
    "zsh"]: ensure => present,
  }

  service {["dev.nginx", "dev.dnsmasq"]: ensure => stopped}
}
