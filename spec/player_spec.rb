require 'rspec'
require './lib/player'

describe Player do
  it 'exists' do
    player = Player.new({name: "Roy Kent", position: "Center Midfielder", salary: 1_000_000})
    expect(player).is_a? Player
  end

  it 'has a name' do
    player = Player.new({name: "Roy Kent", position: "Center Midfielder", salary: 1_000_000})
    expect(player.name).to eq "Roy Kent"
  end

  it 'has a position' do
    player = Player.new({name: "Roy Kent", position: "Center Midfielder", salary: 1_000_000})
    expect(player.position).to eq "Center Midfielder"
  end

  it 'has a salary' do
    player = Player.new({name: "Roy Kent", position: "Center Midfielder", salary: 1_000_000})
    expect(player.salary).to eq 1000000
  end
end
