class SnakesAndLadders 

  attr_reader :token

  def initialize
    @token = { "position" => 0 }
  end

  def start
    @token["position"] = 1
  end
end