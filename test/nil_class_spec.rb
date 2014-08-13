require_relative 'spec_helper'

describe NilClass do

  describe '.cons?' do
    it 'should return false' do
      nil.cons?.must_equal false
    end
  end

  describe '#car' do
    it 'should return nil' do
      nil.car.must_equal nil
    end
  end

  describe '#car=' do
    it 'should raise a NoMethodError' do
      proc { nil.car = :qux }.must_raise NoMethodError
    end
  end

  describe '#cdr' do
    it 'should return nil ' do
      nil.cdr.must_equal nil
    end
  end

  describe '#cdr=' do
    it 'should raise a NoMethodError' do
      proc { nil.cdr = :qux }.must_raise NoMethodError
    end
  end

  describe '#cadr' do
    it 'should return nil' do
      nil.cadr.must_equal nil
    end
  end

  describe '#cadr=' do
    it 'should raise a NoMethodError' do
      proc { nil.cadr = :qux }.must_raise NoMethodError
    end
  end

  describe '#cddr' do
    it 'should return nil' do
      nil.cadr.must_equal nil
    end
  end

  describe '#cddr=' do
    it 'should raise a NoMethodError' do
      proc { nil.cadr = :qux }.must_raise NoMethodError
    end
  end

  describe '.list?' do
    it 'should return true' do
      nil.list?.must_equal true
    end
  end

  describe '#push' do
    it 'should return a new list with on item in it' do
      nil.push(:foo).must_equal Cons.new(:foo, nil)
    end
  end

  describe '#pop' do
    it 'should return nil' do
      nil.pop.must_equal nil
    end
  end

end
