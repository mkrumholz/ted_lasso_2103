class Player

  attr_reader :name, :position, :salary
    def initialize(player_info)
      @name = player_info[:name]
      @position = player_info[:position]
      @salary = player_info[:salary]
    end
  end
