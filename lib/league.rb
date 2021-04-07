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
    all_players = @teams.map do |team|
      team.players
    end

    all_players = all_players.flatten

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


end
