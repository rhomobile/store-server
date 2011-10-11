begin
  require 'vendor/rhoconnect/lib/rhoconnect/tasks'
  require 'vendor/rhoconnect/lib/rhoconnect'
rescue LoadError
  require 'rhoconnect/tasks'
  require 'rhoconnect'
end

ROOT_PATH = File.expand_path(File.dirname(__FILE__))
$:.unshift ROOT_PATH
ENV['ROOT_PATH'] = ROOT_PATH

begin
  require 'resque/tasks'
  task "resque:setup" do
    require 'application'
  end
rescue LoadError
  puts "Resque not available. Install it with: "
  puts "gem install resque\n\n"
end
