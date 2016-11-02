class bash(
            $default_sh     = true,
            $histtimeformat = '%d%m%y %H%M%S -> ',
            $histfilesize   = '1000000',
            $histsize       = '1000000',
            $histcontrol    = 'ignoredups',
          ) inherits bash::params {

  Exec {
    path => '/usr/sbin:/usr/bin:/sbin:/bin',
  }

  package { 'bash':
    ensure => 'installed',
  }

  file { '/etc/profile.d/history.sh':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/history.erb"),
    require => Package['bash'],
  }

  concat { '/etc/profile.d/alias.sh':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['bash'],
  }

  concat::fragment { '/etc/profile.d/alias.sh base':
    target  => '/etc/profile.d/alias.sh',
    content => "# alias bash\n\n# puppet managed file\n\n",
    order   => '+00',
  }

  concat { '/etc/profile.d/environment.sh':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['bash'],
  }

  concat::fragment { '/etc/profile.d/environment.sh base':
    target  => '/etc/profile.d/environment.sh',
    content => "# environment variables bash\n\n# puppet managed file\n\n",
    order   => '+00',
  }

  case $::osfamily
  {
    'redhat':
    {
      if ($default_sh)
      {
        file { '/bin/sh':
          ensure => 'bash',
        }
      }
    }
    'Debian':
    {
      if ($default_sh)
      {
        #ifdefined per compatiblitat amb eyp-ntteam

        if (! defined(Package[$bash::params::debconf]))
        {
          package { $bash::params::debconf:
            ensure => 'installed',
          }
        }

        if ! defined(Exec['dash false'])
        {
          exec {'dash false':
            command => 'echo "dash dash/sh boolean false" | debconf-set-selections',
            notify  => Exec['dash reconfigure'],
            require => Package[$bash::params::debconf],
            unless  => 'debconf-get-selections | grep dash | grep false',
          }
        }

        if ! defined(Exec['dash reconfigure'])
        {
          exec {'dash reconfigure':
            command     => 'dpkg-reconfigure -p critical dash',
            refreshonly => true,
            require     => Package[$bash::params::debconf],
          }
        }

        # root@ubuntu14:~# ls /bin/sh -l
        # lrwxrwxrwx 1 root root 4 Jun 17 09:03 /bin/sh -> dash
        # root@ubuntu14:~# dpkg-reconfigure dash
        # root@ubuntu14:~# echo "dash dash/sh boolean false" | debconf-set-selections
        # root@ubuntu14:~# dpkg-reconfigure -p critical dash
        # Removing 'diversion of /bin/sh to /bin/sh.distrib by dash'
        # Adding 'diversion of /bin/sh to /bin/sh.distrib by bash'
        # Removing 'diversion of /usr/share/man/man1/sh.1.gz to /usr/share/man/man1/sh.distrib.1.gz by dash'
        # Adding 'diversion of /usr/share/man/man1/sh.1.gz to /usr/share/man/man1/sh.distrib.1.gz by bash'
        # root@ubuntu14:~# ls /bin/sh -l
        # lrwxrwxrwx 1 root root 4 Jun 17 09:04 /bin/sh -> bash
        # root@ubuntu14:~#

      }
    }
    default: { }
  }

}
