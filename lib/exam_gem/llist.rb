# require 'pry'

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

class List
  attr_accessor :head, :tail

  include Enumerable

  def each
   #  while @head != nil
   #    yield @head.node_value
   #    @head = @head.node_sig
   #  end  
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
