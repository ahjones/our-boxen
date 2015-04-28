class people::ahjones {
  package {[ 
    "pstree",
    "zsh"]: ensure => present,
  }

  service {["dev.nginx", "dev.dnsmasq"]: ensure => stopped}

  include osx::global::enable_standard_function_keys
  include osx::global::tap_to_click
  include osx::dock::autohide
  include osx::dock::clear_dock
  include osx::finder::show_all_filename_extensions
  include osx::disable_app_quarantine
  include osx::keyboard::capslock_to_control

  class {'alfred': version => '2.7.1_387'}

  include iterm2::dev
  include iterm2::colors::zenburn
}
