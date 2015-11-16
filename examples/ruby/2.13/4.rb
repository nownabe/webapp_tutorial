file_name = ARGV[0]
file_content = File.read(file_name)

file_content.lines.each do |line|
  puts line
end
