#Check if Deployment Type file exists
if File.file?('/usr/local/facts/deployment_type.txt')
  Facter.add('computer_role') do
    setcode do
      %x{cat /usr/local/facts/deployment_type.txt}.chomp
    end
  end
# set to Default if all other checks fail
else
  Facter.add('computer_role') do
    setcode do
      'default'
    end
  end
end
