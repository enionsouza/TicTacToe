class Players
  attr_reader :match_players

  def initialize(name1, name2)
    @match_players = [
      { name: name1, symbol: 'X' },
      { name: name2, symbol: 'O' }
    ]
  end
end
