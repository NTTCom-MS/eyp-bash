define bash::environment(
                          $value,
                          $envname = $name,
                          $user    = undef,
                          $order   = '00',
                        ) {
  include ::bash

  concat::fragment { "/etc/profile.d/environment.sh ${name} ${envname} ${value} ${user}":
    target  => '/etc/profile.d/environment.sh',
    content => template("${module_name}/environment.erb"),
    order   => $order,
  }
}
