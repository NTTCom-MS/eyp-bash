define bash::alias(
                    $value,
                    $envname=$name,
                    $user=undef
                  ) {
  #
  concat::fragment { "/etc/profile.d/environment.sh ${name} ${envname} ${value} ${user}":
    target  => '/etc/profile.d/environment.sh',
    content => template("${module_name}/environment.erb"),
    order   => '99',
  }
}
