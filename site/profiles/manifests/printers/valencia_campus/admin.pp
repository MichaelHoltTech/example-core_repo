# Install and configure an HP LaserJet 4000 Printer

class profiles::printers::valencia_campus::admin {
  printer { "Valencia_Admin_Printer":
      ensure       => present,
      uri          => "lpd://10.40.20.12",
      description  => "Office - Admin Printer",
      location     => "Valencia Office",

      # Printer driver/description
      ppd          => "/Library/Printers/PPDs/Contents/Resources/HP LaserJet 4000 Series.gz", # Full path to vendor PPD

      shared       => false, # Printer will be shared and published by CUPS
      error_policy => abort_job, # underscored version of error policy
      enabled      => true, # Enabled by default
  }
}
