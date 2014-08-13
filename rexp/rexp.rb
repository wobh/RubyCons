

class RExp

  def initialize(*args)
    @car = args.shift
    @cdr = args.shift if args.count == 1 && args.first.is_rexp?
    @cdr = args.RExp.new(args) unless args.empty?
  end

  def is_rexp?(arg)
    arg.respond_to?(:car) && arg.respond_to?(:cdr)
  end

  def cadr
    return nil if cdr.nil?
    cdr.car
  end

  def cddr
    return nil if cdr.nil?
    cdr.cdr
  end

  def cadr=(arg)
    cdr.car = Rexp.new(arg, cddr)
  end

  def cddr=(*args)
    
  end

  def first
    car
  end

  def rest
    return [] if cdr.nil?
    cdr.first.concat(cdr.rest)
  end

  def to_sexp
    "(#{first} #{rest.join(' ')})"
  end

  def call
    if cdr.car.method(car).arity == 1
      rest.inject(first)
    else
      public_send(first, rest)
    end
    #FIXME: Works for trivial cases. 
    # I'm not sure how yet, but this seems deeply wrong.
  end

  class PList

    def initialize(arg_hash={})
      arg_hash.map { |key, val| }
    end

    def to_key_args
      cdr.each_pair.map { |key, val| ":#{key} #{(val || 'nil')}" }.join
    end

    def to_plist
      "(list #{to_key_args})"
    end

  end # RExp::PList

  class AList

    def to_conses
      cdr.each_pair.map do |key, val|
        "(cons #{key} #{(val || 'nil')}"
      end.join
    end

    def to_alist
      "(list #{to_conses})"
    end

    def to_h
      { background: background, foreground: foreground }
    end

    def self.from_h(h)
      self.new(h.fetch(:background), h.fetch(:foreground))
    end

  end # RExp::AList

end # RExp
