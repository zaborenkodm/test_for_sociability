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

puts case answers
when 30..32 then results[0]
when 25..29 then results[1]
when 19..24 then results[2]
when 14..18 then results[3]
when 9..13 then results[4]
when 4..8 then results[5]
when 0..3 then results[6]
end
