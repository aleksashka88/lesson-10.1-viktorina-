# 0. Для работы кирилицы при использовании Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end




QUESTION_COUNT = 3

# 1. считываем все вопросы
files = Dir["#{__dir__}/data/*.txt"]
questions = files.map do |file|
  File.readlines(file, chomp: true, encoding: "UTF-8")
end

# 2. выбираем 3 случайных вопроса в случайном порядке
questions_to_play = questions.sample(QUESTION_COUNT)

# 2.1 Создаем счетчик правильных ответов:
score = 0

# 3. Задаем вопрос пользователю и получаем ответ пользователя
questions_to_play.each do |(question, answer)|
  puts "Вопрос: "
  puts question

  puts "Ваш ответ:"
  user_answer = STDIN.gets.chomp.downcase

# 4. сравниваем с правильным ответом и сообщает, правильно ответил пользователь, или нет
  if user_answer == answer.downcase
    score += 1
    puts "Верно!"
  else
# 5. Если ответ неверный, программа сообщает какой ответ правильный
    puts "Неправильно! Правильный ответ: #{answer}"
  end
end

# 6. В конце сообщает результат — сколько было дано правильных ответов
puts "Вы ответили на #{score} вопросов из #{QUESTION_COUNT}"
