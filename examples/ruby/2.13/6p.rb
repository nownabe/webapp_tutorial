file_name = ARGV[0]
file_content = File.read(file_name)

def width(string)
  string.length + string.chars.count { |c| !c.ascii_only? }
end

file_content.lines.each_with_index do |line, i|
  output_line = ""
  line.size.times do |j|
    if width(line[0..j]) >= 10
      output_line = line[0..j] + "..."
      break
    end
  end
  if output_line.empty?
    output_line = line
  end
  puts output_line
end
