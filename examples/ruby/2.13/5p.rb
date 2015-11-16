file_name = ARGV[0]
file_content = File.read(file_name)

max_spaces = file_content.lines.size.to_s.size

file_content.lines.each_with_index do |line, i|
  spaces = " " * (max_spaces - i.to_s.size)
  puts "#{i}: #{spaces}#{line}"
end
