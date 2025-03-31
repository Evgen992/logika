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

input = STDIN.gets.to_s
good_answers = 0
minutes = 8
timeout_seconds = minutes * 60
begin 
    Timeout.timeout(timeout_seconds) do
    


count = 1
while count <= 12 do
    content = question(count)
    puts content
    input = STDIN.gets.chomp
    p input
    
    answers_input = input_user(count, input, good_answers)

    good_answers = input_user(count, input, good_answers)

    count += 1
    p good_answers
end
end 
rescue Timeout::Error
    puts "Превышен лимит времени"
    
end

puts good_answers