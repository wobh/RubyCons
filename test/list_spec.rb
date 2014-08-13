require_relative 'spec_helper'

describe List do

  before do
    @null = List.new(nil)
    @solo = List.new(:foo)
    @list = List.new(:foo, :bar, :baz, :qux)

    @pair = Cons.new(:bar, :baz)
    @tree = Cons.new(Cons.new(:foo, :bar), Cons.new(:baz, :qux))
  end

  describe '#first' do
    describe 'with list' do
      it 'should return first item' do
        @null.first.must_be_nil
        @solo.first.must_equal :foo
        @list.first.must_equal :foo
      end
    end

    describe 'with cons' do
      it 'should return first item' do
        @pair.first.must_equal :bar
        @tree.first.must_equal Cons.new(:foo, :bar)
      end
    end
  end

  describe '#rest' do
    describe 'with list' do
      it 'should return rest of items' do
        @null.rest.must_be_nil
        @solo.rest.must_be_nil
        @list.rest.must_equal List.new(:bar, :baz, :qux)
      end
    end

    describe 'with cons' do
      it 'should return cdr' do
        @pair.rest.must_equal :bar
        @tree.rest.must_equal Cons.new(:baz, :qux)
      end
    end
  end

  describe '#last' do
    it 'should return last cons cell in list' do
      @null.last.must_be_nil
      @solo.last.must_be_nil
      @list.last.must_equal Cons.new(:qux, nil)
    end
  end

  describe '#push' do
    before do
      @solo.push(:bar)
    end
    it 'should add item to list' do
      @solo.==(Cons.new(:bar, Cons.new(:foo, nil))).must_equal true
    end
  end

  describe '#pop' do
  end

  describe '#==' do
  end

  describe '#to_a' do
  end

  describe '#to_sexp' do
  end

end
