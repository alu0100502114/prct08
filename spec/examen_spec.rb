#encoding: utf-8
require 'spec_helper'
require 'exam_gem'
#require 'Simple_Question/llist'

describe Exam do
  before :each do
    @p1 = Exam::Question.new("Es 4 < 2?", ["Si", "No"], 0, 1)
    @p2 = Exam::Question_TF.new("4 es < 2", 1, 2)
    @p3 = Exam::Question.new("Es 4 > 2?", ["Si", "No"], 1, 1)
    @p4 = Exam::Question_TF.new("4 es > 2", 1, 4)
  end
  describe 'Seleccion simple' do
    it 'Debe de existir una pregunta'do
      expect(@p1.question).to eq("Es 4 < 2?")
    end
    it 'Deben de existir opciones de respuesta' do
      expect(@p1.answers).not_to be_empty
      expect(@p2.answers).not_to be_empty
    end
    it 'Se debe de invocar a un metodo para obtener pregunta' do
      expect(@p1.respond_to? :get_question)
      expect(@p2.respond_to? :get_question)
    end
    it 'Se debe de invocar a un metodo para obtener respuesta' do
      expect(@p1.respond_to? :get_answer)
      expect(@p2.respond_to? :get_answer)
    end
    it 'Al menos una respuesta ha de ser la correcta' do
      expect(@p1.num_r != nil)
      expect(@p2.num_r != nil)
    end
    it 'Se deben de mostrar por consola la pregunta y las respuestas' do
      expect(@p1.respond_to? :to_s)
      expect(@p2.respond_to? :to_s)
    end                 
    it 'Chequear herencia de clase Question_TF' do
      expect(@p2.is_a? Exam::Question).to eq(true)
    end                 
    it 'Pregunta es una instancia de Question' do
      expect(@p2).to be_an_instance_of (Exam::Question_TF)
    end                 
    it 'Solo hay 2 respuestas: Verdadero y Falso' do
      expect(@p2.answers.size == 2  && @p2.answers == ["Verdadero", "Falso"])
    end
    it "Comprueba que una pregunta es de menor nivel que otra" do
      expect(@p1 < @p2).to eq(true)
    end
    it "Comprueba que una pregunta es de mismo nivel que otra" do
      expect(@p1 == @p3).to eq(true)
    end
    it "Comprueba que una pregunta es de mayor nivel que otra" do
      expect(@p4 > @p1).to eq(true)
    end
    it "Debe existir un nivel de pregunta y debe estar entre 0 y 5" do
      expect (@p1.level >= 0 && @p1.level <= 5)
    end
  end                 
end # end describe

describe List do
  before :each do 
    @lista = List.new()
    @lista.ins_start(4)
    @lista.ins_final(3)
    @lista.ins_start(2)
  end 
  it 'Se extrae el primer elemento de la lista.' do
    longi = @lista.length
    @lista.del_start
    expect(@lista.length + 1 == longi)
  end 
  it 'Se puede insertar un elemento.' do
    longi = @lista.length
    @lista.ins_start(5)
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
  it "El maximo debe ser 4" do
    expect(@lista.max == 4).to eq(true)
  end
  it "El minimo debe ser 2" do
    expect(@lista.min == 2).to eq(true)
  end
  it "Comprueba el numero de elementos de la lista" do
    expect(@lista.count).to eq(3)
  end
  it "Comprueba que hay un elemento en la lista" do
    expect(@lista.include?(4)).to eq(true)
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
