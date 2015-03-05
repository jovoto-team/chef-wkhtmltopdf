%w(libfontconfig1 libssl0.9.8 libxext6 libxrender1 fontconfig libjpeg8 fontconfig-config xfonts-base xfonts-75dpi).each do |p|  
  package p do
    action :install
  end
end

include_recipe 'wkhtmltopdf::binary'
