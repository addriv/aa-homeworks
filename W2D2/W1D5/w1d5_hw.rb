class Stack
  attr_accessor :ivar

  def initialize
    @ivar = []
  end

  def add(el)
    ivar.push(el)
  end

  def remove
    ivar.pop
  end

  def show
    ivar.dup
  end
end

class Queue
  attr_accessor :ivar

  def initialize
    @ivar = []
  end

  def enqueue(el)
    ivar.unshift(el)
  end

  def dequeue
    ivar.pop
  end

  def show
    ivar.dup
  end
end

class Map
  attr_accessor :ivar

  def initialize
    @ivar = []
  end

  def assign(key,value)
    if self.lookup(key)
      ivar.map{|pair| pair[1] = value if pair[0] == key}
    else
      ivar << [key,value]
    end
  end

  def lookup(key)
    ivar.each do |pair|
      return true if pair[0] == key
    end
    false
  end

  def remove(key)
    ivar.delete_if {|pair| pair if pair[0] == key}
  end

  def show
    ivar.dup
  end
end
