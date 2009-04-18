require 'rbconfig'
require 'fileutils'

begin
  require 'sdl'
  if SDL::VERSION.to_f < 1.3
    puts "Please install Ruby/SDL version >= 1.3"
    exit
  end
rescue LoadError
  puts "Ruby/SDL not found, please install Ruby/SDL version >= 1.3"
  exit
end

sitelibdir = Config::CONFIG["sitelibdir"]
xibedir = "#{sitelibdir}/xibe"

FileUtils.mkpath xibedir

Dir.glob("lib/*.rb"){|file| FileUtils.install(file, sitelibdir)}
Dir.glob("lib/xibe/*.rb"){|file| FileUtils.install(file, xibedir)}

require 'xibe'
puts "Successfully installed xibe-#{Xibe::VERSION}"