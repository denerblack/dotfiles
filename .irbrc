require 'rubygems'

# This makes pry itself and all pry gems available
$LOAD_PATH.push(*Dir["#{ENV['HOME']}/.prygems/gems/*/lib"]).uniq!

begin
  # Use Pry everywhere
  require 'pry'
  require 'awesome_print'
rescue LoadError => e
  puts e
end

if defined? Pry
  AwesomePrint.pry!
  Pry.start
  exit

else

  # Do your normal IRB stuff in case Pry is not available

end
