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

  context "when the token is on square 1" do
    describe "then it's moved 3 spaces" do
      it "will be on sqaure 4" do
        game.start
        expect(game.move(3)).to eq(4)
        expect(game.token["position"]).to eq(4)
      end

      describe "then it's moved another 4 spaces" do
        it "will be on square 8" do
          game.start
          game.move(3)
          expect(game.move(4)).to eq(8)
          expect(game.token["position"]).to eq(8)
        end
      end
    end
  end
end