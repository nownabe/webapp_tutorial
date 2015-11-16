file_name = ARGV[0]
file_content = File.read(file_name)

file_content.lines.each_with_index do |line, i|
  puts "#{i}: #{line}"
end
