def game_hash
  {:home => {
    :team_name => 'Brooklyn Nets',
    :colors => ['Black', 'White'],
    :players => [ 
      {:player_name => 'Alan Anderson', :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1}, 
      {:player_name => 'Reggie Evans', :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7}, 
      {:player_name => 'Brook Lopez', :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15}, 
      {:player_name => 'Mason Plumlee', :number => 1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5}, 
      {:player_name => 'Jason Terry', :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}]
    },
   :away => {
    :team_name => 'Charlotte Hornets',
    :colors => ['Turquoise', 'Purple'],
    :players => [ 
      {:player_name => 'Jeff Adrien', :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2}, 
      {:player_name => 'Bismack Biyombo', :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10}, 
      {:player_name => 'DeSagna Diop', :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5}, 
      {:player_name => 'Ben Gordon', :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0}, 
      {:player_name => 'Kemba Walker', :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12}]
    }
  }
end


def num_points_scored(player_name)
  game_hash.each{ |team, info_hash|
    info_hash[:players].each { |player|
      if player[:player_name] == player_name
        return player[:points]
      end
    }
  }
end


def shoe_size(player_name)
  game_hash.each{ |team, info_hash|
    info_hash[:players].each { |player|
      if player[:player_name] == player_name
        return player[:shoe]
      end
    }
  }
end

def team_colors(team_name)
  game_hash.each { |team, info_hash|
    if info_hash[:team_name] == team_name
      return info_hash[:colors]
    end
  }
end


def team_names
  arr = []
  game_hash.each { |team, info_hash|
    arr.push(info_hash[:team_name])
  }
  arr
end


def player_numbers(team_name)
  arr = []
  game_hash.each{ |team, info_hash|
    info_hash[:players].each{ |player|
      if info_hash[:team_name] == team_name
        arr.push player[:number]
      end 
    }
  }
  arr
end


def player_stats(player_name)
  stats = {}
    game_hash.each{ |team, info_hash|
    info_hash[:players].each{ |player|
      if player[:player_name] == player_name
        stats[:number] = player[:number]
        stats[:shoe] = player[:shoe]
        stats[:points] = player[:points]
        stats[:rebounds] = player[:rebounds]
        stats[:assists] = player[:assists]
        stats[:steals] = player[:steals]
        stats[:blocks] = player[:blocks]
        stats[:slam_dunks] = player[:slam_dunks]
      end 
    }
  }
  stats
end


def big_shoe_rebounds
  largest_size = 0
  game_hash.each { |team, info_hash|
    info_hash[:players].each{ |player|
      if shoe_size(player[:player_name]) >= largest_size
        largest_size = shoe_size(player[:player_name])
      end
    }
  }
  p largest_size
  game_hash.each { |team, info_hash|
    info_hash[:players].each{ |player|
      if shoe_size(player[:player_name]) == largest_size
        return player[:rebounds]
      end
    }
  }
end

def most_points_scored
  high_score = 0
    game_hash.each { |team, info_hash|
    info_hash[:players].each{ |player|
      if num_points_scored(player[:player_name]) >= high_score
        high_score = num_points_scored(player[:player_name])
      end
    }
  }
  game_hash.each { |team, info_hash|
    info_hash[:players].each{ |player|
      if num_points_scored(player[:player_name]) == high_score
        return player[:player_name]
      end
    }
  }
end

def winning_team
  home_total = 0
  away_total = 0
  game_hash[:home][:players].each{ |player|
    home_total += num_points_scored(player[:player_name])
  }
  game_hash[:away][:players].each{ |player|
    away_total += num_points_scored(player[:player_name])
  }
  if home_total > away_total
    return game_hash[:home][:team_name]
  else 
    return game_hash[:away][:team_name]
  end
end

