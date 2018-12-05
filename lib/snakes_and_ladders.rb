class SnakesAndLadders 

  attr_reader :token

  def initialize
    @token = { "position" => 0 }
  end

  def start
    @token["position"] = 1
  end

  def move(number)
    new_position = @token["position"] + number
    @token["position"] = new_position
  end
end