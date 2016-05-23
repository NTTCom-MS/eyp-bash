
_osfamily               = fact('osfamily')
_operatingsystem        = fact('operatingsystem')
_operatingsystemrelease = fact('operatingsystemrelease').to_f

case _osfamily
when 'RedHat'
  $whaterver = '...'

when 'Debian'
  $whaterver = '...'

else
  $whaterver = '-_-'

end
