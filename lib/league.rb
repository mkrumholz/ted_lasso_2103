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
    players_by_team = Hash.new
    @teams.each do |team|
      player_list = team.players.map do |player|
        player.name
      end
      players_by_team[team] = player_list
    end
    players_by_team
  end

  def most_expensive_player
    all_players = get_all_players

    highest_salary = all_players.max_by do |player|
      player.salary
    end.salary

    most_expensive_overall = []

    all_players.each do |player|
      if player.salary >= highest_salary
        most_expensive_overall << player.name
      end
    end

    most_expensive_overall
  end

  def get_all_players
    all_players = @teams.map do |team|
      team.players
    end

    all_players = all_players.flatten
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
