#mac_laptop.rb
Facter.add(:clean_certname) do
  confine :kernel => "Darwin"
  setcode do
    #Facter::Util::Resolution.exec("/bin/date")
    certname = Facter.value('sp_serial_number').downcase
    certname = certname.sub("+","")
    certname = certname.sub("/","")

    certname.downcase
  end
end

Facter.add(:clean_certname) do
    confine :osfamily => "Debian"
    setcode do
        certname = Facter.value('fqdn')
        certname.downcase
    end
end
