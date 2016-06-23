define bash::alias(
                    $command,
                    $aliasname=$name,
                    $user=undef
                  ) {
  #
  concat::fragment { "/etc/profile.d/alias.sh ${name} ${aliasname} ${command} ${user}":
    target  => '/etc/profile.d/alias.sh',
    content => template("${module_name}/alias.erb"),
    order   => '99',
  }
}
