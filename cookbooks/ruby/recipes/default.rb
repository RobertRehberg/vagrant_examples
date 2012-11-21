ruby_version = '1.9.2-p320'
source_dir = '/tmp/src/ruby'
install_dir = '/opt/ruby'

if File.exists?(install_dir)
  log 'Ruby already installed'
else
  packages_to_install = ['unzip', 'build-essential', 'libreadline-dev', 'libssl-dev', 'libyaml-dev', 'libffi-dev',
                         'libncurses-dev', 'libdb-dev', 'libgdbm-dev', 'tk-dev']
  packages_to_install.each do |p|
    package p do
      options '-y'
    end
  end

  directory source_dir do
    recursive true
    action :delete
  end

  directory source_dir do
    recursive true
    mode 00777
    action :create
  end

  execute 'unzip sources' do
    command "unzip /vendor/ruby/#{ruby_version}/ruby_ubuntu.zip -d #{source_dir}"
  end

  file "#{source_dir}/configure" do
    mode 00777
  end

  file "#{source_dir}/tool/ifchange" do
    mode 00777
  end

  execute 'configure' do
    command "./configure --enable-shared --prefix=#{install_dir}/#{ruby_version}"
    cwd source_dir
  end

  make_commands = ['all', 'test', 'install']
  make_commands.each do |cmd|
    execute "make #{cmd}" do
      command "make #{cmd}"
      cwd source_dir
    end
  end

  link "#{install_dir}/active" do
    action :delete
    only_if "test -L #{install_dir}/active"
  end

  execute 'create sym link' do
    command "ln -fs #{ruby_version} active"
    cwd install_dir
  end

  executables = ['ruby', 'gem', 'rake', 'rspec', 'rdoc', 'ri', 'bundle']

  executables.each do |exe|
    file "/usr/bin/#{exe}" do
      action :delete
    end
  end

  executables.each do |exe|
    link "/usr/bin/#{exe}" do
      to "#{install_dir}/active/bin/#{exe}"
    end
  end
end