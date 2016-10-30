# encoding: utf-8
current_path = File.dirname(__FILE__)
file_question = current_path + "/data/question.txt"
file_results  = current_path + "/data/results.txt"

if File.exist?(file_question)
  f = File.new(file_question, "r:UTF-8")
  question = f.readlines    
  f.close    
else
  puts "\nФайл #{file_question} не найден"
end

if File.exist?(file_results)
  f = File.new(file_results, "r:UTF-8")
  results = f.readlines    
  f.close    
else
  puts "\nФайл #{file_question} не найден"
end

puts "Добрый день! Ответьте на вопросы."

# да - 2 балла, нет - 0 баллов, иногда - 1 балл

yes_answers       = 0
no_answers        = 0
sometimes_answers = 0
answers           = 0

for item in question do
  puts item

  user_input = nil

  until ["yes", "no", "sometimes"].include?(user_input)
    puts "Введите yes, no или sometimes и нажмите Ввод"
    user_input = STDIN.gets.chomp.downcase # Yes NO Sometimes
  end

  case user_input
  when "yes"
    yes_answers += 2
  when "sometimes"
    sometimes_answers += 1    
  end
end

answers = yes_answers + sometimes_answers

puts "\nВаш результат теста (баллов - #{answers}):"

if (answers >= 30)
  puts results[0]
elsif (answers >= 25)
  puts results[1]
elsif (answers >= 19)
  puts results[2]
elsif (answers >= 14)
  puts results[3]
elsif (answers >= 9)
  puts results[4]
elsif (answers >= 4)
  puts results[5]
else
  puts results[6]
end