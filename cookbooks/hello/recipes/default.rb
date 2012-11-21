ruby_block 'hello' do
  block do
    puts "hello from #{node[:hello][:world]}"
  end
end