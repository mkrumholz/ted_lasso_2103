class League

  attr_reader :name, :teams
  def initialize(name)
    @name = name
    @teams = []
  end

  def add_team(team)
    @teams << team
  end

  def captains
    @teams.map do |team|
      team.players.find do |player|
        player.name == team.captain
      end
    end
  end

  def players_by_team
    players_by_team = Hash.new {|hash, team| hash[team] = []}
    @teams.each do |team|
      team.players.each do |player|
        players_by_team[team] << player.name
      end
    end
    players_by_team
  end

  def most_expensive_player
    all_players = get_all_players

    most_expensive = all_players.find_all do |player|
      player.salary >= highest_salary
    end

    most_expensive.map {|player| player.name}
  end

  def get_all_players
    all_players = @teams.map do |team|
      team.players
    end

    all_players = all_players.flatten
  end

  def highest_salary
    all_players = get_all_players

    all_players.max_by do |player|
      player.salary
    end.salary
  end

  def players_by_salary_range
    range_hash = Hash.new
    ranges = ["Over 0M", "Over 1M", "Over 2M", "Over 3M", "Over 4M", "Over 5M"]

    ranges.each do |range|
      range_hash[range] = []
    end

    all_players = get_all_players

    all_players.each do |player|
      if player.salary >= 5_000_000
        range_hash["Over 5M"] << player.name
      elsif player.salary >= 4_000_000
        range_hash["Over 4M"] << player.name
      elsif player.salary >= 3_000_000
        range_hash["Over 3M"] << player.name
      elsif player.salary >= 2_000_000
        range_hash["Over 2M"] << player.name
      elsif player.salary >= 1_000_000
        range_hash["Over 1M"] << player.name
      else
        range_hash["Over 0M"] << player.name
      end
    end

    range_hash
  end
end
