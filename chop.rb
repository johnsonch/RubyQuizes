class Karate
  def self.chop(target, array)
    array.find_index(target) ? array.find_index(target) : -1
  end
end
describe "chop" do
  it 'runs the examples' do
    Karate.chop(3,[]).should eql -1 
    Karate.chop(3,[1]).should eql -1 
    Karate.chop(1,[1]).should eql 0 
    
    Karate.chop(1, [1, 3, 5]).should eql 0
    Karate.chop(3, [1, 3, 5]).should eql 1
    Karate.chop(5, [1, 3, 5]).should eql 2
    Karate.chop(0, [1, 3, 5]).should eql -1
    Karate.chop(2, [1, 3, 5]).should eql -1
    Karate.chop(4, [1, 3, 5]).should eql -1
    Karate.chop(6, [1, 3, 5]).should eql -1

    Karate.chop(1, [1, 3, 5, 7]).should eql 0
    Karate.chop(3, [1, 3, 5, 7]).should eql 1
    Karate.chop(5, [1, 3, 5, 7]).should eql 2
    Karate.chop(7, [1, 3, 5, 7]).should eql 3
    Karate.chop(0, [1, 3, 5, 7]).should eql -1
    Karate.chop(2, [1, 3, 5, 7]).should eql -1
    Karate.chop(4, [1, 3, 5, 7]).should eql -1
    Karate.chop(6, [1, 3, 5, 7]).should eql -1
    Karate.chop(8, [1, 3, 5, 7]).should eql -1
  end
end
