class Team

  attr_reader :name, :coach, :players
  def initialize(name, coach, players)
    @name = name
    @coach = coach
    @players = players
  end

  def total_salary
    players.sum do |player|
      player.salary
    end
  end

  def captain
    highest_paid = players.max_by do |player|
      player.salary
    end
    highest_paid.name
  end

  def positions_filled
    all_player_positions = players.map do |player|
      player.position
    end
    all_player_positions.uniq
  end
end
