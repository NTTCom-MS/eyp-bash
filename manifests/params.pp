class bash::params {

	case $::osfamily
	{
    'redhat':
    {
      #ok
    }
		'Debian':
		{
			$debconf='debconf-utils'
		}
		default: { fail("Unsupported OS!")  }
	}

}
