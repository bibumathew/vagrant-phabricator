# -*- tab-width: 2; indent-tabs-mode: nil -*-
# vim: set tabstop=2 shiftwidth=2 softtabstop=2 expandtab:

class php {
  package { 'php5': ensure => installed }
  package { 'php5-fpm': ensure => installed }
  package { 'php5-mysql': ensure => installed }
  package { 'php5-gd': ensure => installed }
  package { 'php5-dev': ensure => installed }
  package { 'php5-curl': ensure => installed }
  package { 'php-apc': ensure => installed }
  package { 'php5-cli': ensure => installed }

  service { 'php5-fpm':
    ensure => running,
    enable => true
  }

  ini_setting { 'fpm/pool.d/www.conf listen':
    ensure  => present,
    path    => '/etc/php5/fpm/pool.d/www.conf',
    section => 'www',
    setting => 'listen',
    value   => '127.0.0.1:9000',
    notify  => Service['php5-fpm']
  }

  Package['php5-fpm'] -> Service['php5-fpm']
}
