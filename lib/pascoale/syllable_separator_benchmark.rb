require 'pascoale'

correct_counter = 0
wrong_counter = 0
word = nil

begin
  open("#{Pascoale.root}/data/everything.txt") do |file|
    file.each_line do |line|
      begin
        word, _, separation = eval(line)
        next if word =~ /\-/
        s = Pascoale::SyllableSeparator.new(word).separated
        if s == separation
          correct_counter += 1
        else
          wrong_counter += 1
          puts "#{word} - #{s} - #{separation}"
        end
      rescue => e
        puts e.message
      end
    end
  end
ensure
  puts "   Last: #{word}"
  puts "Correct: #{correct_counter}"
  puts "  Wrong: #{wrong_counter}"
end
