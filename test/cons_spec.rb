require_relative 'spec_helper'

describe Cons do

  before do
    @null = Cons.new(nil, nil)
    @solo = Cons.new(:foo, nil)
    @ncar = Cons.new(nil, :qux)
    @pair = Cons.new(:bar, :baz)
    @tree = Cons.new(Cons.new(:foo, :bar), Cons.new(:baz, :qux))
    @list = Cons.new(:foo, Cons.new(:bar, Cons.new(:baz, Cons.new(:qux, nil))))
  end

  describe '#car' do
    it 'should get the value of the car' do
      @null.car.must_equal nil
      @solo.car.must_equal :foo
      @pair.car.must_equal :bar
      @list.car.must_equal :foo
      @tree.car.must_equal Cons.new(:foo, :bar)
    end
  end

  describe '#car=' do
    before do
      @pair.car = :qux
    end

    it 'should set the car value' do
      @pair.must_equal Cons.new(:qux, :baz)
    end
  end

  describe '#cdr' do
    it 'should get the value of the cdr' do
      @null.cdr.must_equal nil
      @solo.cdr.must_equal nil
      @pair.cdr.must_equal :baz
      @tree.cdr.must_equal Cons.new(:baz, :qux)
      @list.cdr.must_equal Cons.new(:bar, Cons.new(:baz, Cons.new(:qux, nil)))
    end
  end

  describe '#cdr=' do
    before do
      @pair.cdr = :qux
    end

    it 'should set the car value' do
      @pair.must_equal Cons.new(:bar, :qux)
    end
  end

  describe '#cadr' do
    it 'should raise NoMethodError if a cdr value has no #car' do
      proc { @pair.cadr }.must_raise NoMethodError
    end

    it 'should get the value of the car of the cdr' do
      @null.cadr.must_equal nil
      @solo.cadr.must_equal nil
      @tree.cadr.must_equal :baz
      @list.cadr.must_equal :bar
    end
  end

  describe '#cadr=' do
    before do
      @list.cadr = :qux
    end

    it 'should set the cadr value' do
      @list.must_equal Cons.new(:foo, 
        (Cons.new(:qux, Cons.new(:baz, Cons.new(:qux, nil)))))
    end
  end

  describe '#cddr' do
    it 'should raise NoMethodError if a cdr value has no #cdr' do
      proc { @pair.cddr }.must_raise NoMethodError
    end

    it 'should get the value of the cdr of the cdr' do
      @null.cadr.must_equal nil
      @solo.cadr.must_equal nil
      @tree.cddr.must_equal :qux
      @list.cddr.must_equal Cons.new(:baz, Cons.new(:qux, nil))
    end
  end

  describe '#cddr=' do
    before do
      @list.cddr = :qux 
    end

    it 'should set the cddr value' do
      @list.must_equal Cons.new(:foo, (Cons.new(:bar, :qux)))
    end
  end

  describe '#==' do
    it 'should be true if the values of the car and cons are equal' do
      @null.==(Cons.new(nil, nil)).must_equal true
      @solo.==(Cons.new(:foo, nil)).must_equal true
      @pair.==(Cons.new(:bar, :baz)).must_equal true
      @tree.==(Cons.new(Cons.new(:foo, :bar), Cons.new(:baz, :qux))).
        must_equal true
      @list.==(Cons.new(:foo,
          Cons.new(:bar, Cons.new(:baz, Cons.new(:qux, nil))))).
        must_equal true
    end
  end

  describe '#to_a' do
    it 'should return a Ruby array representing the cons' do
      @null.to_a.must_equal [nil, nil]
      @solo.to_a.must_equal [:foo, nil]
      @pair.to_a.must_equal [:bar, :baz]
      @tree.to_a.must_equal [[:foo, :bar], [:baz, :qux]]
      @list.to_a.must_equal [:foo, [:bar, [:baz, [:qux, nil]]]]
    end
  end

  describe '#to_sexp' do
    it 'should respond with a string representing an s-expression' do
      @null.to_sexp.must_equal '(cons nil nil)'
      @solo.to_sexp.must_equal '(cons (quote foo) nil)'
      @pair.to_sexp.must_equal '(cons (quote bar) (quote baz))'
      @tree.to_sexp.must_equal(
        '(cons (cons (quote foo) (quote bar)) '\
              '(cons (quote baz) (quote qux)))')
      @list.to_sexp.must_equal(
        '(cons (quote foo) (cons (quote bar) '\
        '(cons (quote baz) (cons (quote qux) nil))))')
    end
  end

  describe '#new' do
    before do
      @atom1 = :foo
      @cons1 = Cons.new(:bar, Cons.new(:baz, nil))
    end

    describe 'with bound values for car and cdr' do
      before do
        @cons2 = Cons.new(@atom1, @cons1)
      end

      it 'should return a new cons cell of those bindings' do
        @cons2.car.equal?(@atom1).must_equal true
        @cons2.cdr.equal?(@cons1).must_equal true
      end
    end
  end

end
