#
# This class sets setting in systemd/system.conf
#
define systemd::system::setting(
  String  $value,
){

  contain systemd::systemctl::daemon_reload

  ini_setting{"systemd_system_setting_${name}":
      ensure  => 'present',
      path    => '/etc/systemd/system.conf',
      section => 'Manager',
      setting => $name,
      value   => $value,
      notify  => Class['systemd::systemctl::daemon_reload'],
    }
}
