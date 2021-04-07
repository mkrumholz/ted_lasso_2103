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
end
