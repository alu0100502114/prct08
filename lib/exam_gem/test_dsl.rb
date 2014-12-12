require_relative 'llist'
require_relative 'pregunta'
require_relative 'test'

# = test_dsl.rb
#
# Autor:: Jesús Marín
# Autor:: Vanessa Marín
#
#
# === Clase TestDSL
# Definicion de la clase Test que permite representar un examen por pantalla mediante los siguientes métodos y también comprobar el resultado del examen
# Para ello hemos definido la clase como DSL
# * metodo initialize
# * metodo question
# * metodo right
# * metodo wrong
#

class TestDSL < ITest

  # Método para inicializar la clase
  def initialize(name = "", &block)
    @good = 0
    @name = name
    @questions = List.new
    @wr = 0

    if block_given?
      if block.arity == 1
        yield
      else
        instance_eval &block
      end
    end
  end

  # Método para cargar una pregunta haciendo uso de DSL
  def question(title, answers = {})
    resp = []
    a = 0
    num_c = 0
    correcta = answers[:right] if answers[:right]
    answers.map do |key,r|
      resp << r
      num_c = a if r == correcta
      a += 1
    end
    @questions.ins_final(Exam::Question.new(title, resp, num_c, 0))
  end

  # Metodo para cargar la respuesta correcta
  def right
    :right
  end

  # Metodo para cargar la/s respuesta/s errónea/s
  def wrong
    @wr += 1
    ("wr"+@wr.to_s).intern
  end
end

if __FILE__ == $0
  quiz = TestDSL.new("Cuestionario de LPP 05/12/2014") do
    question "Cuál es el tipo del objeto en el siguiente código Ruby? class Objeto end",
      wrong => 'Una constante',
      wrong => 'Un objeto',
      right => 'Una instancia de la clase Class',
      wrong => 'Ninguna de las anteriores'

    question '¿Cuántos argumentos de tipo bloque puede recibir un método?',
      right => '1',
      wrong => '2',
      wrong => 'muchos',
      wrong => 'los que defina el usuario'

    question "En Ruby los bloques son objetos que contienen código",
      wrong =>'Cierto',
      right =>'Falso'
  end
  
  quiz.run
end
