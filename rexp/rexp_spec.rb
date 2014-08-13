require 'minitest/autorun'
require 'minitest/pride'
require_relative '../rexp'

describe RExp do

  before do
    @rexp = RExp.new(:+, 1, 2, 3)
  end

  describe '.first' do
    it 'should respond with the first element' do
      @rexp.first.must_equal :+
    end
  end

  describe '.rest' do
    it 'should respond with an array of the rest of the elements' do
      @rexp.rest.must_equal [1, 2, 3]
    end
  end

  describe '.to_sexp' do
    it 'should respond with a string representing an s-expression' do
      @rexp.to_sexp.must_equal '(+ 1 2 3)'
    end
  end

  describe '.call' do
    it 'should respond with the result of calling the first element with the arguments of the rest of the elements' do
      @rexp.call.must_equal 6
    end
  end

end
  
  

  
