name "debian"
description "Attributes specific to the Debian platform family"
run_list(
)
default_attributes(
  "vagrant" => {
    "url" => "https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.3_x86_64.deb"
  }
)