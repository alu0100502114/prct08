#encoding: utf-8
# require 'spec_helper'
require 'exam_gem'

describe TestDSL do
  before :each do
    @t1 = TestDSL.new("Cuestionario de LPP 05/12/2014") {
      question '¿Cuántos argumentos de tipo bloque puede recibir un método?',
        right => '1',
        wrong => '2',
        wrong => 'muchos',
        wrong => 'los que defina el usuario'

      question "En Ruby los bloque son objetos que contienen codigo",
        wrong =>'Cierto',
        right =>'Falso'
    
      question "Cuál es el tipo del objeto en el siguiente codigo Ruby? class Objeto end",
        wrong => 'Una constante',
        wrong => 'Un objeto',
        right => 'Una instancia de la clase Class',
        wrong => 'Ninguna de las anteriores'
    }
  end
  
  it "Se debe poder leer las preguntas" do
    expect(@t1.respond_to? :question)
  end

  it "Se debe poder leer la respuesta correcta" do
    expect(@t1.respond_to? :right)
  end
  
  it "Se debe poder leer las respuestas erroneas" do
    expect(@t1.respond_to? :wrong)
  end
  
  it "Se crea bien el examen" do
    expect(@t1.name) == "Cuestionario de LPP 05/12/2014"
  end
  
  it "Se debe poder invertir el orden de las preguntas" do
    expect(@t1.respond_to? :inverse)
  end

  it "Se debe poder realizar por pantalla un examen" do
    expect(@t1.respond_to? :run)
  end

  it "Se debe poder mostrar por pantalla un examen" do
    expect(@t1.respond_to? :to_s)
  end
  
  it "Se debe poder corregir un examen" do
    expect(@t1.respond_to? :check)
  end

  it "Debe existir alguna pregunta en el examen" do
    expect(@t1.questions.count >= 1).to eq(true)
  end

  it "Comprobar que no hay preguntas iguales" do
    p1 = @t1.questions.head
    while p1.node_sig != nil
      p2 = p1.node_sig
      while p2 != nil
        expect(p1.node_value == p2.node_value).to eq(false)
        p2 = p2.node_sig
      end
      p1 = p1.node_sig
    end
  end
  
  it "Examen perfecto" do
    expect(@t1.check([0, 1, 2])).to eq(3)
  end
  
  it "Examen aprobado" do
    expect(@t1.check([1, 1, 2])).to be >= 2
  end
  
  it "Examen suspenso" do
    expect(@t1.check([0, 0, 1])).to be < 2
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
      expect(p.node_value.respond_to? :get_answer)
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
      expect(p.node_value.num_r != nil)
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
    expect(@t1.questions.count).to eq(3)
  end
end
