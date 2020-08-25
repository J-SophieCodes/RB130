# class TextAnalyzer
#   def process
#     file = File.open("sample_text.txt")

#     yield(file.readlines.map(&:chomp))

#     file.close
#   end
# end

# analyzer = TextAnalyzer.new

# analyzer.process do |text| 
#   para = text.count("") + 1
#   puts "#{para} paragraphs"
# end

# analyzer.process do |text| 
#   lines = text.size
#   puts "#{lines} lines"
# end

# analyzer.process do |text| 
#   words = text.reduce(0) do |total, line|
#             total + line.split.size
#           end
#   puts "#{words} words"
# end

class TextAnalyzer
  def process
    file = File.open('sample_text.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split(' ').count} words" }
# analyzer.process { |text| p text }