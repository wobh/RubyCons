class Cons

  attr_accessor :car, :cdr

  def initialize(car, cdr)
    @car = car
    @cdr = cdr
  end

  def cadr
    cdr.car
  end

  def cddr
    cdr.cdr
  end

  def cadr=(arg)
    @cdr = Cons.new(arg, cddr)
  end

  def cddr=(arg)
    @cdr = Cons.new(cadr, arg)
  end

  def ==(arg)
    arg.cons? && car == arg.car && cdr == arg.cdr
  end

  def to_a
    [car, cdr].map do |val|
      val.nil? ? nil : val.cons? ? val.to_a : val
    end
  end

  def to_sexp
    "(cons %s %s)" % [car, cdr].map do |val|
      val.nil? ? 'nil' : val.cons? ? val.to_sexp : "(quote #{val})"
    end
  end

end
