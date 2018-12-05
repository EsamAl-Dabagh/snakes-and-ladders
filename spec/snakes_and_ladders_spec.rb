require 'snakes_and_ladders.rb'

describe SnakesAndLadders do

  let(:game) { SnakesAndLadders.new }

  context "when a game is started" do
    it "will place the token on square 1" do
      game.start
      expect(game.token["position"]).to eq(1)
    end
  end
end