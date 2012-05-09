class Game
  def initialize
    score_card = []
    self.frames.times.each
      score_card << Game.roll
    end
  end

  def self.roll
    rand(0..10)
  end

  def frames
    10
  end
end

describe "bowing game" do
  it 'returns 10 frames per game' do
   @bowling_game = Game.new
   @bowling_game.frames.should == 10
  end

  it 'rolls the ball for each frame' do

  end
  
end
