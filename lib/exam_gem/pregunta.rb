module Exam
  # Your code goes here...
  class Question
    attr_accessor :answers, :question, :num_r

    # Constructor de la clase
    def initialize(question = get_question, answers = get_answers, num_r = get_right)
      raise ArgumentError,
        "La Pregunta ha de ser una cadena, y es #{question.class}" unless question.is_a? String
      raise ArgumentError,
        "Las Respuestas han de ser un Array, y son #{answers.class}" unless answers.is_a? Array
      raise ArgumentError,
        "El Número de la respuesta correcta ha de ser un entero, y es #{num_r.class}" unless num_r.is_a? Integer
      @question = question
      @answers = answers
      @num_r = num_r
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
  end

  # Clase para representar la clase de preguntas de Verdadero y Falso
  class Question_TF < Question
 
    # Metodo para inicializar sobrecargando
    def initialize(question = get_question, num_r = get_right)
      raise ArgumenError, "La pregunta ha de ser una Cadena, y es #{question.class}" unless question.is_a? String
      @question = question
      @answers = ["Verdadero", "Falso"]
      @num_r = num_r
    end
  
    # Obtener Respuesta correcta sobrecargando
    def self.get_right
      puts "Si la respuesta es correcta teclee 0, en caso contrario teclee 1"
      @num_r = gets.chomp.to_i
    end
  end

end

#p = Exam::Question_TF.new(Exam::Question_TF.get_question, Exam::Question_TF.get_right)
#puts p
#p = Exam::Question.new(Exam::Question.get_question, Exam::Question.get_answers, Exam::Question.get_right)
#puts "-----"
#puts p
