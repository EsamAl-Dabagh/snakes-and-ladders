class SnakesAndLadders 

  attr_reader :token, :win_status

  def initialize
    @token = { "position" => 0 }
    @win_status = false
  end

  def start
    @token["position"] = 1
  end

  def roll_die
    move(rand(1..6))
  end

  def move(number)
    new_position = @token["position"] + number
    @token["position"] = new_position
    check_for_winner
    display_winner_message
    @token["position"]
  end

  def check_for_winner
    if @token["position"] == 100
      @win_status = true
    end
  end

  def display_winner_message
    if @win_status == true
      "Congratulations, you won!"
    end
  end
end