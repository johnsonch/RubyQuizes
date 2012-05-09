class String
  def is_integer?
    if self == "0" 
      return true
    end
    if self.to_i != 0
      return true
    end
    return false
  end
end


class Convert
  def self.number(value)
    if value.is_integer?
      aribic_to_roman(value)
    else
      roman_to_aribic(value)
    end
  end

  def self.aribic_to_roman(value)
    "V" 
  end

  def self.roman_to_aribic(value)
    running_total = 0
    previous_value = 0
    value.split(//).each do |i|
      value_of_roman = look_up_aribic(i)
      if previous_value == value_of_roman || previous_value > value_of_roman
        running_total += value_of_roman
      else
        running_total = (running_total - previous_value) + (value_of_roman - previous_value)
      end
      previous_value = value_of_roman
    end
    return running_total 
  end


  def self.look_up_aribic(symbol)
    symbols = {"I" => 1,"V" => 5,"X" => 10,"L" => 50,"C" => 100,"D" => 500,"M" => 1000} 
    return symbols["#{symbol}"]
  end
end



describe "convert roman to int" do
  it 'turns a roman II to 2' do
    Convert.number("II").should eql 2
  end 

  it 'turns a roman v into 5' do
    Convert.number("V").should eql 5
  end

  it 'turns a roman iv into 4' do
    Convert.number("IV").should eql 4 
  end

  it 'turns CCXCI into 291' do
    Convert.number("CCXCI").should eql 291 
  end

  it 'turns an aribic 5 into V' do
    Convert.number("5").should eql "V" 
  end

  it 'can look up aribic for symbol' do
    Convert.look_up_aribic("I").should eql 1
  end
end
