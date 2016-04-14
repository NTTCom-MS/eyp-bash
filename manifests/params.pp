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
    default: { fail('Unsupported OS!')  }
  }

}
