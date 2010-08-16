require 'rubygems'
require 'rake'

$:.unshift File.expand_path("../lib", __FILE__)
require 'gem/commands/whois_command'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "gem-whois"
    gem.version = Gem::Command::WhoisCommand::VERSION
    gem.summary = %Q{Show information about the owner of a gem}
    gem.email = "<ddollar@gmail.com>"
    gem.homepage = "http://github.com/ddollar/gem-whois"
    gem.authors = ["David Dollar"]
    gem.files = Dir['lib/**/*.rb']
  end

rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end
