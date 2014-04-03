default[:locale][:locale_gen_file]  = "/etc/locale.gen"
default[:locale][:language]          = "en"
default[:locale][:territory]        = "US"
default[:locale][:charset]          = "UTF-8"
default[:locale][:default]          = "#{locale[:language].downcase}_" <<
                                      "#{locale[:territory].upcase}." <<
                                      "#{locale[:charset]}"
