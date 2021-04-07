require 'rspec'
require './lib/player'
require './lib/team'
require './lib/league'

describe League do
  it 'exists' do
    premier = League.new("Premier League")
    expect(premier).is_a? League
  end

  it 'has a name' do
    premier = League.new("Premier League")

    expect(premier.name).to eq "Premier League"
  end

  it 'has a place to store teams' do
    premier = League.new("Premier League")

    expect(premier.teams).to eq []
  end

  it 'can add teams' do
    premier = League.new("Premier League")
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])
    premier.add_team(richmond)
    premier.add_team(manchester)

    expect(premier.teams).to eq [richmond, manchester]
  end

  it 'has a list of captains' do
    premier = League.new("Premier League")
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])
    premier.add_team(richmond)
    premier.add_team(manchester)

    expect(premier.captains).to eq [roy, fernandinho]
  end

  it 'can list players by team' do
    premier = League.new("Premier League")
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])
    premier.add_team(richmond)
    premier.add_team(manchester)
    expected = {
      richmond => ["Roy Kent", "Sam Obisanya"],
      manchester => ["Jamie Tartt", "Fernandinho"]
    }

    expect(premier.players_by_team).to eq expected
  end

  it 'returns the most expensive player (1)' do
    premier = League.new("Premier League")
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])
    premier.add_team(richmond)
    premier.add_team(manchester)

    expect(premier.most_expensive_player).to eq ["Fernandinho"]
  end

  it 'returns the most expensive players (2)' do
    premier = League.new("Premier League")
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
    de_bruyne = Player.new({name: "Kevin De Bruyne", position: "Midfielder", salary: 5_200_000})
    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho, de_bruyne])
    premier.add_team(richmond)
    premier.add_team(manchester)

    expect(premier.most_expensive_player).to eq ["Fernandinho", "Kevin De Bruyne"]
  end

  it 'can group players by salary range' do
    premier = League.new("Premier League")
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
    de_bruyne = Player.new({name: "Kevin De Bruyne", position: "Midfielder", salary: 5_200_000})
    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho, de_bruyne])
    premier.add_team(richmond)
    premier.add_team(manchester)
    expected = {
      "Over 0M" => ["Sam Obisanya"],
      "Over 1M" => ["Roy Kent", "Jamie Tartt"],
      "Over 2M" => [],
      "Over 3M" => [],
      "Over 4M" => [],
      "Over 5M" => ["Fernandinho", "Kevin De Bruyne"]
    }

    expect(premier.players_by_salary_range).to eq expected
  end
end
