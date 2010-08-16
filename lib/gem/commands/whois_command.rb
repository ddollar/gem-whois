require 'rubygems/command'
require 'rubygems/command_manager'
require 'rubygems/uninstaller'
require 'crack'

class Gem::Commands::WhoisCommand < Gem::Command

  VERSION = "0.2"

  def initialize
    super 'whois', 'Show information about the owner of a gem'
  end

  def execute
    require 'rest-client'
    name = get_one_gem_name
    Gem.sources.each { |source| whois_from_source(name, source) }
  rescue Exception => ex
    puts "Unhandled Exception: #{ex.class} #{ex.message}"
  end

private ######################################################################

  def whois_from_source(name, source)
    info = Crack::JSON.parse(RestClient.get([source, "api/v1/gems/#{name}.json"].join))
    say "%s (%s)" % [ info["name"], info["version"] ]
    say
    say info["info"]
    say
    say "author(s) : %s" % info["authors"]
    say "downloads : %s" % info["downloads"]
    say "homepage  : %s" % info["homepage_uri"]
  rescue RestClient::ResourceNotFound
    say "%s not found in source %s" % [name, source]
  end

end
