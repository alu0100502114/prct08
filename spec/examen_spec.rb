require 'spec_helper'
require 'exam_gem'

module Exam
  class Simple_Selection
    describe Exam::Simple_Selection do
      before :all do
        @p1 = Question.new("Pregunta?")
      end
      describe 'Selección simple' do
        it 'Debe de existir una pregunta'do
          expect(@p1.question).to eq("Pregunta: Pregunta?")
        end
        it 'Debe de existir un método para obtener la pregunta' do
          expect(@p1.question).to eq("Pregunta: Pregunta?")
        end
        it 'Deben de existir opciones de respuesta' do
          @p1.add_answer("Si.")
          expect(@p1.answer).not_to be_empty
        end
        it 'Se debe de invocar a un método para obtener pregunta' do
          @p1.add_answer("No.")
          expect(@p1.answer).to eq("1) Si.\n2) No.\n")
        end
        it 'Se deben de mostrar por consola la pregunta y las respuestas' do
          expect(@p1.to_s).to eq("Pregunta: Pregunta?\n\n1) Si.\n2) No.\n")
        end                 
      end # end describe

      it 'Prueba relación de preguntas' do
        @p1 = Question.new("¿Cuál es la salida del siguiente código Ruby?")
        @p1.add_answer("<#Xyz:0xa000208>")
        @p1.add_answer("nil")
        @p1.add_answer("0")
        @p1.add_answer("Ninguna de las anteriores")

        @p2 = Question.new("La siguiente definición de un hash en ruby es válida:\nhash_raro = {\n[1,2,3] => Object.new(),\nHash.new => :toto")
        @p2.add_answer("Cierto")
        @p2.add_answer("Falso") 

        @p3 = Question.new("¿Cuál es la salida del siguiente código Ruby?") 
        @p3.add_answer("1") 
        @p3.add_answer("bob")
        @p3.add_answer("HEY")
        @p3.add_answer("Ninguna de las anteriores")
 
        @p4 = Question.new("¿Cuál es el tipo de objeto en el siguiente código Ruby?\nclass Objeto\nend")
        @p4.add_answer("Una instancia de la clase Class") 
        @p4.add_answer("Una constante")
        @p4.add_answer("Un objeto") 
        @p4.add_answer("Ninguna de las anteriores")

        @p5 = Question.new("¿Es apropiado que una clase Tablero herede de una clase Juego?")
        @p5.add_answer("Verdadero") 
        @p5.add_answer("Falso") 
 
        @n1 = Node.new(@p1) 
        @n2 = Node.new(@p2)
        @n3 = Node.new(@p3)
        @n4 = Node.new(@p4) 
        @n5 = Node.new(@p5)

        @lista = List.new() 
        @lista.add_node(@n1)
        @lista.add_node(@n2) 
        @lista.add_node(@n3) 
        @lista.add_node(@n4)
        @lista.add_node(@n5) 
      end
    end # end it

    describe Exam::Simple_Selection do
      before :each do 
        @lista = List.new()
        @n1 = Node.new("Nodo 1")
        @n2 = Node.new("Nodo 2")
      end 
      it 'Debe de ser posible el insertar nodos en la lista.' do
        @lista.add_node(@n1)
        expect(@lista.head).to eq(@n1)
      end 
      it 'Se pueden insertar varios elementos.' do
        @lista.add_node(@n1)
        @lista.add_node(@n2)
        expect(@lista.head).to eq(@n2)
        @lista.rm_node
        expect(@lista.head).to eq(@n1)
      end 
      it 'Se extrae el primer elemento de la lista.' do
        @lista.add_node(@n1)
        @lista.add_node(@n2)
        @lista.rm_node
        expect(@lista.head).to eq(@n1)
      end  
    end # end describe

  end # end class

end # end module
