require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

# 
# Specifying additional methods in the Vector class
# 
describe Vector do
  # Before each spec sentence
  before(:each) do
    # create a vector
    @vector = Vector.elements( [4,10,29,2,5,1] )
    @column_vector = Vector.elements( [ [1], [2], [29], [5], [10] ])
    @column_for_abs = Vector.elements( [ [1], [-9], [8] ])
  end
  
  
  
  ## Class methods
  describe "class methods" do
    # #blank 
    # A method to create an empty vector (elements == zeros )
    # Usage: 
    # Vector.blank(4) => Vector with 4 zeroes as elements 
    # 
    it "should have #blank method on class" do
      Vector.should respond_to(:blank)
      Vector.blank(4).to_a.should == [0,0,0,0]
    end
    
    it "should have #range method to build from range!" do
      Vector.should respond_to(:range)
      Vector.range(0...5).to_a.should == [0,1,2,3,4]
    end
  end
  
  ## Instance methods 
  
  ## MAX and MIN values in vector
  describe "Max and min methods and friends" do

    # Some specs are related to new #max, #min, #max_index, #min_index methods
    # It should have #max!
    it "should have #max method" do
      @vector.max.should == 29.0
    end

    it "should have #min method" do
      @vector.min.should == 1.0
    end

    it "should get max_index properly" do
      @vector.max_index.should == 2
    end

    it "should get min_index properly" do
      @vector.min_index.should == 5
    end

    it "should find max in column_vector" do
      @column_vector.max.should == 29
    end

    it "should get max_index in column_vector" do
      @column_vector.max_index.should == 2
    end

    # After some time i've created max_value_and_index methods, they work just the same way. 

    it "should get max_value_and_index correctly" do
      value, index = @column_vector.max_value_and_index
      value.should == 29.0
      index.should == 2
    end

    it "should get absolute_max element correctly" do
      value, index = @column_for_abs.absolute_max_value_and_index
      value.should == 9.0
      index.should == 1
    end
  end
  
  ## Slices
  describe "Slices" do
    # Slicing vector returns a vector. 
     it "should be able to slice vector" do
       @column_vector.slice(2..5).should == Vector.elements([ [29], [5], [10] ])
     end

     # Note, that searching for max element in the slice returns it's index in the slice!
     # not in the original vector! 
     it "another slice example" do
       @left_side_matrix = Matrix.rows([
         [ 7, 8, 4, -6],
         [ -1, 6, -2, -6],
         [ 2, 9, 6, -4],
         [ 5, 9, 1, 1]
       ])

       v,i = @left_side_matrix.column(2).slice(2..3).absolute_max_value_and_index
       v.should == 6
       i.should == 0
     end
  end
end