default['wkhtmltopdf']['version']     = '0.12.2.1'

case node['platform_family']
when 'mac_os_x', 'mac_os_x_server'
  default['wkhtmltopdf']['dependency_packages'] = []
  default['wkhtmltopdf']['platform'] = 'macosx-10.9.1-x86_64'
when 'windows'
  default['wkhtmltopdf']['dependency_packages'] = []
  if node['kernel']['machine'] == 'x86_64'
    default['wkhtmltopdf']['platform'] = 'win64'
  else
    default['wkhtmltopdf']['platform'] = 'win32'
  end
else
  default['wkhtmltopdf']['dependency_packages'] = value_for_platform_family(
    %w(debian) => %w(libfontconfig1 libssl0.9.8 libxext6 libxrender1 fontconfig libjpeg8 fontconfig-config xfonts-base xfonts-75dpi),
    %w(fedora rhel) => %w(fontconfig libXext libXrender openssl-devel urw-fonts)
  )
  if node['kernel']['machine'] == 'x86_64'
    default['wkhtmltopdf']['platform'] = 'linux-amd64'
  else
    default['wkhtmltopdf']['platform'] = 'linux-i386'
  end
end

default['wkhtmltopdf']['package']     = "wkhtmltox-#{node['wkhtmltopdf']['version']}_linux-precise-amd64.deb"
default['wkhtmltopdf']['mirror_url']  = "https://downloads.wkhtmltopdf.org/0.12/#{node['wkhtmltopdf']['version']}/#{node['wkhtmltopdf']['package']}"
default['wkhtmltopdf']['mirror_url']  = "https://assets-diverse.s3.amazonaws.com/development/wkhtmltox-0.12.2.1_linux-precise-amd64.deb"
