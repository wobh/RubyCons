require 'forwardable'

class List
  extend Forwardable

  def_delegators :@items, :car, :car=, :cdr, :cdr=, :cadr, :cadr=, :cddr, :cddr=, :==
  def initialize(*items)
    @items = cons_items(items)
  end
  
  def make_list(size, item=nil)
    return nil if size.zero?
    Cons.new(item, make_list((size - 1), item))
  end

  def first
    car
  end

  def rest
    cdr
  end

  def last
    return if cdr.nil?
    rest.last
  end

  def push(item)
    @items = Cons.new(item, @items)
  end

  def pop
    @items = @items.cdr
  end

  def cons_items(items)
    return nil if items.empty?
    Cons.new(items.shift, cons_items(items))
  end

end
