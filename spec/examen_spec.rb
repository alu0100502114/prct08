require 'spec_helper'
require 'exam_gem'
#require 'Simple_Question/llist'

describe Exam do
  before :each do
    @p1 = Exam::Question.new("Es 4 < 2?", ["Si", "No"], 2)
    @p2 = Exam::Question_TF.new("4 es < 2", 1)
  end
  describe 'Selección simple' do
    it 'Debe de existir una pregunta'do
      expect(@p1.question).to eq("Es 4 < 2?")
    end
    it 'Deben de existir opciones de respuesta' do
      expect(@p1.answers).not_to be_empty
    end
    it 'Se debe de invocar a un método para obtener pregunta' do
      expect(@p1.respond_to? :get_question)
    end
    it 'Se debe de invocar a un método para obtener respuesta' do
      expect(@p1.respond_to? :get_answer)
    end
    it 'Al menos una respuesta ha de ser la correcta' do
      expect(@p1.num_r != nil)
    end
    it 'Se deben de mostrar por consola la pregunta y las respuestas' do
      expect(@p1.respond_to? :to_s)
    end                 
    it 'Chequear herencia de clase Question_TF' do
      expect(@p2.is_a? Exam::Question).to eq(true)
    end                 
    it 'Pregunta es una instancia de Question' do
      expect(@p2).to be_an_instance_of (Exam::Question_TF)
    end                 
    it 'Sólo hay 2 respuestas: Verdadero y Falso' do
      expect(@p2.answers.size == 2  && @p2.answers == ["Verdadero", "Falso"])
    end                 
  end                 
end # end describe

describe List do
  before :each do 
    @lista = List.new()
    @lista.ins_start("Nodo s")
    @lista.ins_final("Nodo f")
  end 
  it 'Se extrae el primer elemento de la lista.' do
    longi = @lista.length
    @lista.del_start
    expect(@lista.length + 1 == longi)
  end 
  it 'Se puede insertar un elemento.' do
    longi = @lista.length
    @lista.ins_start(1)
    expect(@lista.length - 1 == longi)
  end 
  it 'Se pueden insertar varios elementos.' do
    longi = @lista.length
    @lista.ins_start(2)
    @lista.ins_start(3)
    @lista.ins_final(3)
    expect(@lista.length - 3 == longi)
  end 
  it 'Debe de exisir una cabeza en la lista.' do
    expect(@lista.head != nil)
  end 
end # end describe

describe Node do
  before :each do
    @lista = List.new
    @lista.ins_start(6)
    @lista.ins_start(9)
  end

  it 'Debe existir un Nodo de la lista con sus datos y su siguiente' do
    expect(@lista.head.node_value != nil && @lista.head.node_sig != nil)
  end
end
