class NilClass
  def car; end
  def cdr; end
  def cadr; end
  def cddr; end

  def list?
    true
  end

  def push(item)
    List.new(item)
  end

  def pop
    nil
  end

end
