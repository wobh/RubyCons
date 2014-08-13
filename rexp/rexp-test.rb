require 'minitest/autorun'
require 'minitest/pride'
require_relative '../rexp'

describe RExp do

  before do
    @rexp = RExp.new(:foo, :bar, :baz, :qux)
  end

  describe '#first' do
    it 'should respond with the first element' do
      @rexp.first.must_equal :foo
    end
  end

  describe '#rest' do
    it 'should respond with an array of the rest of the elements' do
      @rexp.rest.must_equal [:bar, :baz, :qux]
    end
  end

end
  
  

  
