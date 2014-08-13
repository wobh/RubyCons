class BasicObject
  def cons?
    respond_to?(:car=) && respond_to?(:cdr=)
  end
  def atom?
    not cons?
  end
  def list?
    return false unless cons?
    return true if cdr.nil?
    cdr.cons?
  end
end
