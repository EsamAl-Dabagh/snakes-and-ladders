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

  describe "#move" do
    context "when the token is on square 1" do
      describe "then it's moved 3 spaces" do
        it "will be on square 4" do
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

  describe "#roll_die" do
    it "a random number between 1 and 6 is generated" do
      allow(game).to receive(:rand).and_return(4)
      expect(game.roll_die).to eq(4)
    end

    it "moves the token by rolled amount" do
      game.start
      allow(game).to receive(:rand).and_return(4)
      expect(game.roll_die).to eq(5)
      expect(game.token["position"]).to eq(5)
    end
  end

  describe "#check_for_winner" do
    context "when token position is 100" do

      before(:each) do
        game.token["position"] = 100
      end

      it "returns true" do
        expect(game.check_for_winner).to eq(true)
      end

      it "sets win_status to true" do
        game.check_for_winner
        expect(game.win_status).to eq(true)
      end
    end
  end

  describe "#display_winner_message" do

    before(:each) do
      game.token["position"] = 100
      game.check_for_winner
    end
    
    specify { expect { game.display_winner_message }.to output("Congratulations, you won!\n").to_stdout }
  end
end