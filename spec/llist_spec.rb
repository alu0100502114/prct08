require 'spec_helper'
require 'exam_gem'
#require 'Simple_Question/llist'

describe Exam do
  before :each do
    @lista = List.new
    @lista.ins_start(Exam::Question.new('¿Cual es la salida del siguiente codigo Ruby? class Xyz def pots @nice end end xyz = Xyz.new p xyz.pots',['#<Xyz:0xa000208>', 'nil', '0', 'Ninguna de las anteriores'], 1))
    @lista.ins_final(Exam::Question_TF.new('La siguiente definicion de un hash en Ruby es validad: hash_raro = { [1, 2, 3] => Object.new(), Hash.new => :toto }',['Cierto', 'Falso'], 0))
    @lista.ins_final(Exam::Question.new('¿Cual es la salida del siguiente codigo Ruby? class Array def say_hi "HEY!" end end p [1, "bob"].say_hi',['1', 'bob', 'HEY!', 'Ninguna de las anteriores'], 2))
    @lista.ins_final(Exam::Question.new('¿Cual es el tipo del objeto en el siguiente codigo Ruby? class Objeto end',['Una instancia de la clase Class', 'Una constante', 'Un objeto', 'Ninguna de las anteriores'], 0))
    @lista.ins_final(Exam::Question_TF.new('Es apropiado que una clase Tablero herede de una clase Juego',['Cierto', 'Falso'], 0))

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

  it "Se debe de invocar a un metodo para obtener la pregunta" do
    p = @lista.head
    while p.node_sig != nil
      expect(p.node_value.respond_to? :get_question)
      p = p.node_sig
    end
  end
         
  it "Se debe de invocar a un metodo para obtener las opciones de respuesta" do
    p = @lista.head
    while p.node_sig != nil
      expect(p.node_value.respond_to? :get_answers)
      p = p.node_sig
    end
  end
        
  it "Debe de existir, al menos, una respuesta correcta" do
    p = @lista.head
    while p.node_sig != nil
      expect(p.node_value.num_r != nil)
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
