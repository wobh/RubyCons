require_relative 'spec_helper'

describe BasicObject do

  before do
    @null = Cons.new(nil, nil)
    @solo = Cons.new(:foo, nil)
    @ncar = Cons.new(nil, :qux)
    @pair = Cons.new(:bar, :baz)
    @tree = Cons.new(Cons.new(:foo, :bar), Cons.new(:baz, :qux))
    @list = Cons.new(:foo, Cons.new(:bar, Cons.new(:baz, Cons.new(:qux, nil))))
  end

  describe '.cons?' do
    it 'should be true with a cons' do
      @null.cons?.must_equal true
      @solo.cons?.must_equal true
      @ncar.cons?.must_equal true
      @pair.cons?.must_equal true
      @tree.cons?.must_equal true
      @list.cons?.must_equal true
    end

    it 'should be false with an atom' do
      nil.cons?.must_equal false
      123.cons?.must_equal false
      :foo.cons?.must_equal false
      "foo".cons?.must_equal false
      {foo: :bar, baz: :qux}.cons?.must_equal false
      [:foo, :bar, :baz, :qux].cons?.must_equal false
    end
  end

  describe '.atom?' do
    it 'should be true with an atom' do
      nil.atom?.must_equal true
      123.cons?.must_equal true
      :foo.atom?.must_equal true
      {foo: :bar, baz: :qux}.cons?.must_equal true
      [:foo, :bar, :baz, :qux].atom?.must_equal true
    end

    it 'should be false with a cons' do
      @null.atom?.must_equal false
      @solo.atom?.must_equal false
      @ncar.atom?.must_equal false
      @pair.atom?.must_equal false
      @tree.atom?.must_equal false
      @list.atom?.must_equal false
    end
  end

  describe '.list?' do
    before do
      @null = List.new(nil)
      @solo = List.new(:foo)
      @list = List.new(:foo, :bar, :baz, :qux)
    end

    it 'should true with a list' do
      @null.list?.must_equal true
      @solo.list?.must_equal true
      @list.list?.must_equal true
    end

    it 'should be true with a cons' do
      @pair.list?.must_equal true
      @tree.list?.must_equal true
    end
    
    it 'should be false with an atom' do
      nil.list?.must_equal false
      123.list?.must_equal false
      :foo.list?.must_equal false
      "foo".list?.must_equal false
      {foo: :bar, baz: :qux}.list?.must_equal false
      [:foo, :bar, :baz, :qux].list?.must_equal false
    end
  end

end
