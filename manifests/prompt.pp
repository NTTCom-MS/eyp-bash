define bash::prompt (
                      $ps1  = $name,
                      $user = undef
                    ) {
  include ::bash

  concat::fragment { "/etc/profile.d/prompt.sh ${name} ${ps1} ${user}":
    target  => '/etc/profile.d/prompt.sh',
    content => template("${module_name}/prompt.erb"),
    order   => '99',
  }
}
