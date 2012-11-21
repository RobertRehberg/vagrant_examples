ruby_version = '1.9.2-p320'

if File.exists?('/opt/ruby')
  log 'Ruby already installed'
else
  packages_to_install = ['unzip', 'build-essential', 'libreadline-dev', 'libssl-dev', 'libyaml-dev', 'libffi-dev',
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

  execute 'unzip sources' do
    command "unzip /vendor/ruby/#{ruby_version}/ruby_ubuntu.zip -d /tmp/src/ruby"
  end

  file '/tmp/src/ruby/configure' do
    mode 00777
  end

  file '/tmp/src/ruby/tool/ifchange' do
    mode 00777
  end

  execute 'configure' do
    command "./configure --enable-shared --prefix=/opt/ruby/#{ruby_version}"
    cwd '/tmp/src/ruby'
  end

  execute 'make all' do
    command "make all"
    cwd '/tmp/src/ruby'
  end

  execute 'make test' do
    command "make test"
    cwd '/tmp/src/ruby'
  end

  execute 'make install' do
    command "make install"
    cwd '/tmp/src/ruby'
  end

  link '/opt/ruby/active' do
    action :delete
    only_if 'test -L /opt/ruby/active'
  end

  file '/usr/bin/ruby' do
    action :delete
  end

  file '/usr/bin/gem' do
    action :delete
  end

  file '/usr/bin/rake' do
    action :delete
  end

  execute 'create sym link' do
    command "ln -fs #{ruby_version} active"
    cwd '/opt/ruby'
  end

  ['ruby', 'gem', 'rake', 'rspec', 'rdoc', 'ri', 'bundle'].each do |exe|
    link "/usr/bin/#{exe}" do
      to "/opt/ruby/active/bin/#{exe}"
    end
  end
end