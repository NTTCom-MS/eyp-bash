# puppet2sitepp @bashumasks
define bash::umask(
                    $value,
                    $user  = $name,
                    $order = '00',
                  ) {
  include ::bash

  concat::fragment { "/etc/profile.d/umask.sh ${user} umask ${value}":
    target  => '/etc/profile.d/umask.sh',
    content => template("${module_name}/umask.erb"),
    order   => $order,
  }
}
