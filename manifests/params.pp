class bash::params {

  case $::osfamily
  {
    'redhat':
    {
      $debconf=undef
    }
    'Debian':
    {
      $debconf='debconf-utils'
    }
    'Suse':
    {
      $debconf=undef
    }
    default: { fail('Unsupported OS!')  }
  }

}
