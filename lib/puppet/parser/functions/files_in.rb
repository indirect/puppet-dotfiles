module Puppet::Parser::Functions
  newfunction(:files_in, :type => :rvalue) do |args|
    dir = args[0]
    excludes = args[1] || []
    includes = args[2] || []
    path = File.expand_path(dir)
    glob = File.join(path, "*")
    files = Dir[glob].map{|f| File.basename(f) }
    files.reject!{|f| excludes.include?(f) }
    files + includes
  end
end
