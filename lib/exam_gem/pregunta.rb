require "version"

# Modulo Exam
module Exam
  # Definición de Clase Question
   # * metodo <=>
   # * metodo ==
   # * metodo get_question
   # * metodo get_level
   # * metodo get_answers
   # * metodo get_right
   # * metodo get_answer
   # * metodo initiliaze
   # * metodo to_s
  class Question

    # Atributo answers, para almacenar las respuestas de la pregunta
    # Atributo question, para almacenar la pregunta en sí
    # Atributo num_r, numero de la respuesta correcta
    # Atributo level, nivel de la pregunta
    attr_accessor :answers, :question, :num_r, :level

    # Módulo que permite comparar niveles de preguntas
    include Comparable

    # Compara nivel de 2 preguntas haciendo uso de Comparable
    def <=> (anOther)
      @level <=> anOther.level
    end

    # Compara si una pregunta es igual a otra
    def == (anOther)
      @level == anOther.level && @question == anOther.question
    end

    # Obtener nivel de pregunta
    def self.get_level
      print "Digite dificultad en la pregunta, 0 menor a 10 mayor"
      @level = gets.chomp.to_i
    end

    # Obtener título de pregunta mediante entrada de teclado
    def self.get_question
      puts 'Digite pregunta'
      question = gets.chomp
      return question
    end

    # Obtener diferentes respuestas a la pregunta pidiendo primero la cantidad de éstas
    def self.get_answers
      puts "Digite número de respuestas de la pregunta"
      num = gets.chomp.to_i
      c = []
      while num != 0
        c = c + get_answer(c.length + 1)
        num -= 1
      end
      @answers = c
    end

    # Obtener dentro de la clase Pregunta índice con la respuesta correcta
    def self.get_right
      puts "Digite el número de la respuesta correcta"
      @num_r = gets.chomp.to_i
    end

    # Obtener una respuesta simple
    def self.get_answer(num)
      puts "Digite Respuesta #{num}"
      ans = [gets.chomp]
      return ans
    end

    # Añadir respuesta 
    def self.add_answer(answer)
       @answers.push(answer)
    end

    # Metodo para mostrar por pantalla la pregunta y las posibles respuestas
    def to_s
      out = "# #{@question}" + "\n"
      i = 1
      answers.each do |a|
        out << " #{i}.- #{a}\n"
        i += 1
      end
      out
    end

    #x Revisar
    def inv(list, i)
        list[list.size-1-i]
    end

    #x Revisar
    def inverse(list)
        output = list.map.with_index do |x,i|
            inv(list, i)
        end
    end

    # Constructor de la clase
    def initialize(question = get_question, answers = get_answers, num_r = get_right, level = get_level)
      raise ArgumentError,
        "La Pregunta ha de ser una cadena, y es #{question.class}" unless question.is_a? String
      raise ArgumentError,
        "Las Respuestas han de ser un Array, y son #{answers.class}" unless answers.is_a? Array
      raise ArgumentError,
        "El Número de la respuesta correcta ha de ser un entero, y es #{num_r.class}" unless num_r.is_a? Integer
      @question = question
      @answers = answers
      @num_r = num_r
      @level = level
    end
  end

  # Clase para representar la clase de preguntas de Verdadero y Falso
  # Definición de la clase Question_TF que es hija de Question y que constituye un caso particular de la clase Pregunta para preguntas de Verdadero y Falso.
  # Hace uso de los metodos de Question además de:
  # * metodo initialize. Con overriding sobre el de Question
  # * metodo get_right. Con overriding sobre el de Question
  class Question_TF < Question
 
    # Metodo para inicializar sobrecargando
    def initialize(question = get_question, num_r = get_right, level = get_level)
      raise ArgumenError, "La pregunta ha de ser una Cadena, y es #{question.class}" unless question.is_a? String
      @question = question
      @answers = ["Verdadero", "Falso"]
      @num_r = num_r
      @level = level
    end
  
    # Obtener Respuesta correcta sobrecargando
    def self.get_right
      puts "Si la respuesta es correcta teclee 0, en caso contrario teclee 1"
      @num_r = gets.chomp.to_i
    end
  end

end
