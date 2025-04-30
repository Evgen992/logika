require_relative "method.rb"
require 'timeout'

puts "Тест логического мышления"
puts "Необходимо определить формальную правильность того 
или иного логического умозаключения на основе 
определенного утверждения (или ряда утверждений). 
Реальная действительность не играет при этом никакой роли 
(это немного усложняет тест, 
поскольку содержание утверждений абсурдно, но логически безупречно). 
Учитывайте так же то, 
что правильных ответов может вообще не быть или их может быть больше одного."

puts "На нижеследующие 12 заданий отводится 8 минут! Поехали?:\n
Нажмите любую кнопку, чтобы продолжить"

input = STDIN.gets.to_s #спрашиваем у пользователя ответ
good_answers = 0
minutes = 8
timeout_seconds = minutes * 60
count = 1

begin 
    Timeout.timeout(timeout_seconds) do 
        #метод для ограничения времени на прохождение
        #теста
    



while count <= 12 do #цикл задаёт вопрос нужное количеств раз
    content = question(count)
    puts content
    puts
    puts "Введите ваш вариант ответа или несколько вариантов 
    через запятую(\"а, б\") или ноль(0), если ввы считаете, что
    все варианты неправильные"
    puts
    input = STDIN.gets.chomp

    arr = ["а", "б", "в", "г", "д", "е", "0"]

answers = input.split(",").map { |char| char.strip.downcase }#разбиваем ввод на массив срок

until answers.all? { |char| arr.include?(char) } 
  #проверяем ответ на наличие в нём нужных элементов 
  #из ввода пользователя
  puts "Ошибка! Допустимы: а, б, в, г, д, е или 0."
  input = STDIN.gets.chomp
  answers = input.split(",").map { |char| char.strip.downcase }
    #разбиваем ввод на массив строк, убираем пробелы, приводим к нижнему регистру
end

    good_answers = input_user(count, input, good_answers) 
      #добовляем правильные ответы

    count += 1

end
end 
rescue Timeout::Error
    puts "Превышен лимит времени"
    
    
end

puts " Ваш результат:#{good_answers}"

 result = print_result(good_answers)