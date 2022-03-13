require "option_parser"
require "colorize"

the_beatles = [
  "John Lennon",
  "Paul McCartney",
  "George Harrison",
  "Ringo Starr",
]

shout = false
say_hi_to = ""
strawberry = false

OptionParser.parse do |parser|
  parser.banner = "Welcome to #{"the Beatles".colorize(:yellow).on(:black)} App"

  parser.on "-v", "--version", "Show Version" do
    puts "Version 1.0"
    exit
  end

  parser.on "-h", "--help", "show Help" do
    puts parser
    exit
  end

  parser.on "-t", "--twist", "Twist and SHOUT" do
    shout = true
  end

  parser.on "-g NAME", "--goodbye_hello=NAME", "Say Hello to whomever you want" do |name|
    say_hi_to = name
  end

  parser.on "-r", "--random_goodbye_hello", "Say Hello to one random member" do
    say_hi_to = the_beatles.sample
  end

  parser.on "-s", "--strawberry", "Strawberry fields forever mode ON" do
    strawberry = true
  end
  
  parser.missing_option do |option_flag|
    STDERR.puts "ERROR: #{option_flag} is missing something"
    STDERR.puts ""
    STDERR.puts parser
    exit(1)
  end
  parser.invalid_option do |option_flag|
    STDERR.puts "ERROR: #{option_flag} is not a valid option"
    STDERR.puts parser
    exit(1)
  end
end


members = the_beatles
members = the_beatles.map &.upcase if shout

puts "Strawberry field forever mode ON" if strawberry

puts ""
puts "Group Members"
puts "============="
members.each do |member|
  puts "#{strawberry ? "🍓" : "-"} #{member}"
end

unless say_hi_to.empty?
  puts ""
  puts "You say goodbye, and #{the_beatles.sample} says hello to #{say_hi_to}"
end