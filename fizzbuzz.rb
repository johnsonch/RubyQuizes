
class Game
  def self.fizzbuzz
    Array(1..100).map{|x| output(x) }
  end

  def self.output(statement)
    puts is_fizz_buzz?(statement) || is_fizz?(statement) || is_buzz?(statement) || statement
  end

  def self.is_fizz_buzz?(statement)
   is_fizz?(statement) && is_buzz?(statement) ? "fizzbuzz" : false
  end
  
  def self.is_fizz?(number)
   number.to_i % 3 == 0 ? "fizz" : false
  end

  def self.is_buzz?(number)
    number.to_i % 5 == 0 ? "buzz" : false
  end
end


describe "game" do
  it 'has a fizzbuzz method' do
    Game.fizzbuzz 
  end  

  it 'counts to 100' do
    Game.should_receive(:output).exactly(100).times
    Game.fizzbuzz 
  end

  it 'prints out fizz if number is divisible by 3' do
    Game.is_fizz?(3).should == "fizz" 
  end

  it 'does not print out fizz if a number is not divisible by 3' do
    Game.is_fizz?(5).should_not == "fizz" 
  end

  it 'prints out buzz if number is divisible by 5' do
    Game.is_buzz?(5).should == "buzz"
  end

  it "prints out fizzbuzz if number is divisible by 3 and 5" do
    Game.is_fizz_buzz?(15).should == "fizzbuzz"
  end
end
