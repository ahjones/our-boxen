class people::ahjones {
  package { 
    "pstree": ensure => present,
    "zsh": ensure => present,
  }
}
