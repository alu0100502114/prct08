# require 'pry'

# === Clase Node
# Definición de la clase Node que permite almacenar y representar un nodo con un elemento anterior y otor posterior por pantalla mediante los siguientes metodos
# * metodo initialize
# * metodo to_s
# * metodo node_value
# * metodo node_sig
# * metodo node_ant
# * metodo edi_sig
# * metodo edi_ant
#
Node = Struct.new(:value, :sig, :ant) do
  # Constructor de la clase
  def initialize (value, sig, ant)
    @value = value
    @sig = sig
    @ant = ant
  end
  
  # Obtener el valor de un nodo
  def node_value
    return @value
  end

  # Obtener puntero a siguiente nodo
  def node_sig
    return @sig
  end

  # Obtener puntero a anterior nodo
  def node_ant
    return @ant
  end

  # Cambiar puntero a siguiente nodo
  def edi_sig(sig)
    @sig = sig
  end

  # Cambiar puntero a anterior nodo
  def edi_ant(ant)
    @ant = ant
  end

  # Mostrar por pantalla un nodo
  def to_s
    if @sig == nil && @ant == nil
      "#{@value} " 
    else 
      "#{@value} <-> " 
    end
  end
end

# === Clase List
# Definición de la clase Lista que permite almacenar, trabajar y representar una lista doblemente enlazada por pantalla mediante los siguientes metodos
# * metodo each
# * metodo initialize
# * metodo ins_start
# * metodo ins_final
# * metodo del_start
# * metodo del_final
# * metodo to_s
# * metodo length
#
class List
  # Atributo head para mostrar el inicio de la lista
  # Atributo tail para mostrar el final de la lista
  attr_accessor :head, :tail

  # Se incluye el módulo enumerable para poder hacer uso de sus métodos
  include Enumerable

  # Para recorrer la lista y hacer uso del módulo enumerable
  def each
    n = @head
    while n != nil
      yield n.node_value
      n = n.node_sig
    end
  end

  # Constructor de la clase
  def initialize
    @head = nil
    @tail = nil
  end

  # Insertar un nodo al principio de la lista
  def ins_start(value)
    if @head != nil && @head.node_sig != nil
      n = @head
      @head = Node.new(value, n, nil)
      n.edi_ant(@head)
    elsif @head != nil
      n = @head
      @head = Node.new(value, n, nil)
      n.edi_ant(@head)
      @tail = n
    else
      @head = Node.new(value, nil, nil)
      @tail = @head
    end
  end

  # Eliminar un nodo del principio de la lista
  def del_start
    @head = @head.node_sig
    if @head != nil
      @head.edi_ant(nil)
    end
  end
 
  # Insertar un nodo al final de la lista
  def ins_final(value)
    if @tail != nil
      @tail = Node.new(value, nil, @tail)
      n = @tail.node_ant
      n.edi_sig(@tail)
    else
      @head = Node.new(value, nil, nil)
      @tail = @head
    end
  end

  # Metodo para eliminar un nodo del final de la lista
  def del_final
    @tail = @tail.node_ant
    if @tail != nil
      @tail.edi_sig(nil)
    else
      @head = @tail
    end
  end

  # Obtener el número de nodos de una lista
  def length 
    if @head == nil
      num = 0
    else
      n = @head
      num = 1
      while n.node_sig != nil
        num += 1
        n = n.node_sig
      end
    end
    num
  end
  
  # Representar por pantalla una lista enlazada
  def to_s
    s = "NIL <-> "
    if @head == nil
       s << "NIL"
    elsif @head.node_sig == nil
      s << "#{@head.to_s}<-> NIL"
    else
      nodo = @head
      while nodo.node_sig != nil 
        s << "#{nodo.to_s}"
        nodo = nodo.node_sig
      end
      s << "#{nodo.to_s}"
      s << "NIL"
    end
    return s
  end
end
