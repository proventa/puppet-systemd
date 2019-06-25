# **NOTE: THIS IS A [PRIVATE](https://github.com/puppetlabs/puppetlabs-stdlib#assert_private) CLASS**
#
# This class provides a solution to enable accounting
#
class systemd::system {

  assert_private()

  $systemd::accounting.each |$option, $value| {
    systemd::system::setting{$option:
      value => $value,
    }
  }
}
