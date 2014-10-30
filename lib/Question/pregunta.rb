class Question

   attr_reader :question, :answer

   def initialize(question)
      @question = question
      @answer = Array.new(0)

   end

   def question
      "Pregunta: #{@question}"
   end

   def add_answer (answer)
      @answer.push(answer)
   end

   def answer
      answers = ""
      for i in (0..(@answer.length - 1))
         # answers += "#{(97+i).chr}) #{@answer[i]}\n"
         answers += "#{i+1}) #{@answer[i]}\n"
      end
      answers
    end

   def to_s
      question + "\n\n" + answer
   end
end

