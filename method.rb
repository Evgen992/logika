def question(number)
  current_path = File.dirname(__FILE__)
  file_question = File.join(current_path, "text#{number}.txt")

  unless File.exist?(file_question)
    puts "Файл не найден, обратитесь к разработчику"
    return nil  # важно возвращать nil при отсутствии файла
  end

  File.read(file_question, encoding: 'UTF-8')
rescue => e
  puts "Произошла ошибка при чтении файла: #{e.message}"
  nil
end


def input_user(count, input, good_answers)
  current_path = File.dirname(__FILE__)
  file_answers = File.join(current_path, 'answers.txt')

 if File.exist?(file_answers)
  answers = File.new(file_answers, 'r:UTF-8')

  arr_answers = answers.readlines.map(&:strip)
  answers.close

 else
  puts "Файл не найден, обратитесь к разработчику"
 end
  
 if arr_answers[count - 1] == input.strip
  good_answers += 1
 else
  good_answers
 end
end

def print_result(count)
  case count 
  when 0..2
    puts "C логикой у вас очень слабо"
  when 3..6 
    puts "Логика не отсутствует, но, 
    наверное, имеет смысл ее потренировать."
  when 7..10
    puts "Вполне приемлемый результат, 
    говорящий о нормально развитых логических способностях"
  when 11..12
    puts "говорят о хорошо развитых логических способностях. 
    Вас трудно убедить речами, в которых есть логические неувязки. 
    Вы видите многие ситуации «насквозь» и можете «предсказывать» 
    поведение людей из вашего окружения."
  end
end
 
# def input_user(count, input, good_answers)
#   # Предположим, у вас есть массив правильных ответов
#   correct_answers = ["б", "а", "б", "а", "а", "б", "0", "в", "а, в, г", "в, г", "0", "0"] # и так далее
#   if input == correct_answers[count -1]
#       good_answers += 1 # Увеличиваем количество правильных ответов
#   end
#   good_answers # Возвращаем обновленное значение
# end
