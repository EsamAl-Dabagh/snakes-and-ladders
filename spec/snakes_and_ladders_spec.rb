require 'snakes_and_ladders.rb'

describe SnakesAndLadders do

  let(:game) { SnakesAndLadders.new }

  context "before a game is started" do
    it "the position will be 0" do
      expect(game.token["position"]).to eq(0)
    end
  end

  context "when a game is started" do
    it "the token will be on square 1" do
      game.start
      expect(game.token["position"]).to eq(1)
    end
  end
end