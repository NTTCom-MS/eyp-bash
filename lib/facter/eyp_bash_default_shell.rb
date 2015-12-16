
Facter.add('eyp_bash_default_shell') do
    setcode do
        Facter::Util::Resolution.exec('ls -ld /bin/sh | awk \'{ print $NF }\'')
    end
end
