require_relative 'llist'
require_relative 'pregunta'

# === Clase Test
# Definicion de la clase Test que permite representar un examen por pantalla mediante los siguientes métodos y también comprobar el resultado del examen
# * metodo initialize
# * metodo to_s
# * metodo check
#
class Test

  # Atributo name que guarda el titulo del examen
  # Atributo questions que guarda las diferentes respuestas del examen
  attr_accessor :name, :questions

  # Constructor de la clase
  def initialize(name, questions)
    # @counter = 0
    @good = 0
    @name = name
    @questions = questions
  end

  # def right
  #   :right
  # end

  # Mostrar el examen por pantalla
  def to_s
    q = "#{@name}" + "\n"
    @questions.each do |p|
      q << p.to_s + "\n"
    end
    q
  end

  # Comprobar las respuestas dadas del examen
  def check(answ)
    r = 0
    @questions.each do |q|
      if q.num_r == answ[r]
        @good += 1
      end
      r +=1
    end
    @good
  end
  
  # Invertir el order de las preguntas sin programación funcional
  def inverse
    q_inv = List.new
    @questions.each do |p|
      q_inv.ins_start(p)
    end
    @questions = q_inv
  end

  # Invertir el order de las preguntas siguiendo programacion funcional
  def inverse_auto
    q_inv = List.new
    @questions.map { |n| q_inv.ins_start(n) }
    @questions = q_inv
  end
end

# === Clase ITest
# Definición de la clase ITest que es hija de Test y permite representar un examen por pantalla y mediante una interfaz de usuario obtener el resultado del examen. Posee los siguientes metodos
# * metodo run
#
class ITest < Test

  # Para realizar examen por pantalla
  def run
    puts @name
    @questions.each do |q|
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
