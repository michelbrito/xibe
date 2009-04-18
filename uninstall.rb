require 'rbconfig'
require 'fileutils'

begin
  require 'xibe'
rescue LoadError
  puts "Xibe is not installed"
  exit
end

version = Xibe::VERSION

sitelibdir = Config::CONFIG["sitelibdir"]
xibedir = "#{sitelibdir}/xibe"

FileUtils.rm "#{sitelibdir}/xibe.rb", :force => true
FileUtils.remove_dir xibedir, :force => true

puts "Successfully uninstalled xibe-#{version}"