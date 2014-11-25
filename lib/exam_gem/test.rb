# Clase Test

require_relative 'llist'
require_relative 'pregunta'

WRONG = false
RIGHT = true

class Test

  attr_accessor :name, :questions
  def initialize(name, questions)
    # @counter = 0
    @good = 0
    @name = name
    @questions = questions
  end

  def right
    :right
  end

  # Mostrar el examen por pantalla
  def to_s
    q = "#{@name}" + "\n"
    @questions.each do |p|
      q << p.to_s + "\n"
    end
    q
  end

  # Metodo para comprobar las respuestas dadas del examen
  def check(answ)
    r = 0
    @questions.each do |q|
      if q.num_c == answ[r]
        @good += 1
      end
      r +=1
    end
    @aciertos
  end
end

class ITest < Test
  def run
    puts name
    questions.each do |q|
      puts q
      print "Tu respuesta: "
      answ = gets.chomp.to_i
      if q.num_r == answ - 1
        puts "Correcto!"
        @good += 1
      else
        puts "Fallo!!!, la respuesta correcta es #{q.num_r+1}"
      end
      puts
    end
    puts "Has acertado #{@good} pregunta(s)"
  end
end
