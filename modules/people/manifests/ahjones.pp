class people::ahjones {
  package {[ 
    "pstree",
    "zsh"]: ensure => present,
  }

  package { "emacs": ensure => present, install_options => [ "--with-cocoa" ] }

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
  include java

  include chrome

  file { '/Applications/Emacs.app' : ensure => 'link', target => '/opt/boxen/homebrew/Cellar/emacs/24.5/Emacs.app', require => Package["emacs"] }

  osx_chsh { $::luser: shell => '/opt/boxen/homebrew/bin/zsh', require => Package['zsh'], }
}
