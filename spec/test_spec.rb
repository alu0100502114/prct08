#encoding: utf-8
require 'spec_helper'
require 'exam_gem'

describe Test do
  before :each do
    @lista = List.new
    @lista.ins_inicio(Exam::Question.new('¿Cuál es la salida del siguiente codigo Ruby? class Xyz def pots @nice end end xyz = Xyz.new p xyz.pots', ['#<Xyz:0xa000208>', 'nil', '0', 'Ninguna de las anteriores'], 1, 0))
    @lista.ins_final(Exam::Question.new('La siguiente definicion de un hash en Ruby es validad: hash_raro = { [1, 2, 3] => Object.new(), Hash.new => :toto }', ['Cierto', 'Falso'], 0, 1))
    @lista.ins_final(Exam::Question.new('Cuál es la salida del siguiente codigo Ruby? class Array def say_hi "HEY!" end end p [1, "bob"].say_hi', ['1', 'bob', 'HEY!', 'Ninguna de las anteriores'], 2, 2))
    @lista.ins_final(Exam::Question.new('Cuál es el tipo del objeto en el siguiente codigo Ruby? class Objeto end', ['Una instancia de la clase Class', 'Una constante', 'Un objeto', 'Ninguna de las anteriores'], 0, 3))
    @lista.ins_final(Exam::Question_VF.new('Es apropiado que una clase Tablero herede de una clase Juego', 0, 4))
    @lista.ins_final(Exam::Question.new('¿Cuál es la salida del siguiente codigo Ruby? class Xyz def pots @nice end end xyz = Xyz.new p xyz.pots', ['#<Xyz:0xa000208>', 'nil', '0', 'Ninguna de las anteriores'], 1, 1))
    @t1 = ITest.new("Examen de Ruby", @lista)
  end

  it "Se debe poder realizar por pantalla un examen" do
    expect(@t1.respond_to? :run)
  end

  it "Se debe poder mostrar por pantalla un examen" do
    expect(@t1.respond_to? :to_s)
  end

  it "Debe existir alguna pregunta en el examen" do
    expect(@t1.questions.count >= 1).to eq(true)
  end

  it "Deben existir opciones de respuestas" do
    p = @t1.questions.head
    while p.node_sig != nil
      expect(p.node_value.answers).not_to be_empty
      p = p.node_sig
    end
  end

  it "Se debe invocar a un método para obtener la pregunta" do
    p = @t1.questions.head
    while p.node_sig != nil
      expect(p.node_value.respond_to? :get_question)
      p = p.node_sig
    end
  end

  it "Se debe invocar a un método para obtener las opciones de respuesta" do
    p = @t1.questions.head
    while p.node_sig != nil
      expect(p.node_value.respond_to? :get_answers)
      p = p.node_sig
    end
  end

  it "Debe existir al menos una respuesta correcta" do
    p = @t1.questions.head
    while p.node_sig != nil
      expect(p.node_value.num_c != nil)
      p = p.node_sig
    end
  end

  it "Se debe mostrar por la consola la pregunta y las opciones de respuesta" do
    p = @t1.questions.head
    while p.node_sig != nil
      expect(p.node_value.respond_to? :to_s)
      p = p.node_sig
    end
  end

  it "Comprueba el numero de preguntas en el examen" do
    expect(@t1.questions.count).to eq(6)
  end

  it "Comprueba que una pregunta es de menor nivel que otra" do
    expect(@t1.questions.head.node_value < @t1.questions.head.node_sig.node_value).to eq(true)
    expect(@t1.questions.head.node_sig.node_value < @t1.questions.head.node_value).to eq(false)
  end

  it "Examen sobresaliente" do
    expect(@t1.check([1, 0, 2, 0, 0, 1])).to eq(6)
  end

  it "Examen aprobado justito" do
    expect(@t1.check([1, 0, 2, 1, 1, 0])).to be >= 3
  end

  it "Examen suspenso con ganas" do
    expect(@t1.check([1, 1, 2, 1, 1, 0])).to be < 3
  end
end
