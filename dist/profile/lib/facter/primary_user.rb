Facter.add('primary_user') do
  setcode do
     Facter::Core::Execution.exec("/usr/sbin/ac -p | sort -nrk 2 | sed "1d" | AWK '{ print $1; exit }'")
  end
end
