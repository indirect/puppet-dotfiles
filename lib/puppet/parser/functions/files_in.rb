module Puppet::Parser::Functions
  newfunction(:files_in, :type => :rvalue) do |args|
    path = File.expand_path(args.first)
    glob = File.join(path, "*")
    Dir[glob].map{|f| File.basename(f) }
  end
end
