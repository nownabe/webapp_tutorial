file_name = ARGV[0]
file_content = File.read(file_name)

file_content.lines.each_with_index do |line, i|
  if line.length >= 11
    puts "#{line[0...10]}..."
  else
    puts line
  end
end
