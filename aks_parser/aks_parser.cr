require "json"


if ARGV.empty?
  puts "You need to specify the JSON to parse"
  exit
end

puts "AKS Parser"