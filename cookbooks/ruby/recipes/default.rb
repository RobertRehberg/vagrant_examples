ruby_version = '1.9.2-p320'

if File.exists?('/opt/ruby')
  log 'Ruby already installed'
else
  package 'unzip' do
    options '-y'
  end

  packages_to_install = ['build-essential', 'libreadline-dev', 'libssl-dev', 'libyaml-dev', 'libffi-dev',
                         'libncurses-dev', 'libdb-dev', 'libgdbm-dev', 'tk-dev']
  packages_to_install.each do |p|
    package p do
      options '-y'
    end
  end

  directory '/tmp/src/ruby' do
    recursive true
    action :delete
  end

  directory '/tmp/src/ruby' do
    recursive true
    mode 00777
    action :create
  end

  bash 'Install ruby from source' do
    code <<-EOF
      unzip /vendor/ruby/#{ruby_version}/ruby_ubuntu.zip -d /tmp/src/ruby
    EOF
  end
end