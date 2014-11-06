require 'spec_helper'
require 'exam_gem'
#require 'Simple_Question/llist'

describe Exam do
  before :each do
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
  end # end before

  it "Debe de existir una pregunta" do
    p = @lista.head
    while p.node_sig != nil
      expect(p.node_value.question).not_to be_empty
      p = p.node_sig
    end
  end

  it "Deben de existir opciones de respuestas" do
    p = @lista.head
    while p.node_sig != nil
      expect(p.node_value.answers).not_to be_empty
      p = p.node_sig
    end
  end

  it "Se debe de invocar a un método para obtener la pregunta" do
    p = @lista.head
    while p.node_sig != nil
      expect(p.node_value.respond_to? :get_question)
      p = p.node_sig
    end
  end
         
  it "Se debe de invocar a un método para obtener las opciones de respuesta" do
    p = @lista.head
    while p.node_sig != nil
      expect(p.node_value.respond_to? :get_answers)
      p = p.node_sig
    end
  end
        
  it "Debe de existir, al menos, una respuesta correcta" do
    p = @lista.head
    while p.node_sig != nil
      expect(p.node_value.num_c != nil)
      p = p.node_sig
    end
  end    

  it "Se debe de mostrar por la consola la pregunta y las opciones de respuesta" do
    p = @lista.head
    while p.node_sig != nil
      expect(p.node_value.respond_to? :to_s)  
      p = p.node_sig
    end
  end
end # end describe
