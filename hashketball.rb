require 'pry'
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end

def num_points_scored(player_name)
  to_search = {}
  if game_hash[:home][:players].include?(player_name)
    to_search = game_hash[:home][:players][player_name][:points]
  elsif game_hash[:away][:players].include?(player_name)
    to_search = game_hash[:away][:players][player_name][:points]
  end
  to_search
end

def shoe_size(player_name)
  to_search = {}
  if game_hash[:home][:players].include?(player_name)
    to_search = game_hash[:home][:players][player_name][:shoe]
  elsif game_hash[:away][:players].include?(player_name)
    to_search = game_hash[:away][:players][player_name][:shoe]
  end
  to_search
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name && data == team_name
        return team_data[:colors]
      end
    end
  end
end

def team_names
  game_hash.map do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team_name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      result = team_data[:players].map do |player, stats|
        stats[:number]
      end
      return result
    end
  end
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players && team_data[:players].include?(player_name)
        return team_data[attribute][player_name]
      end
    end
  end
end

def big_shoe_rebounds
  big_shoe = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if stats[:shoe] > big_shoe
            big_shoe = stats[:shoe]
            rebounds = stats[:rebounds]
          end
        end
      end
    end
  end
  rebounds
end

def most_points_scored
  max_points = 0
  max_player = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if stats[:points] > max_points
            max_points = stats[:points]
            max_player = player
          end
        end
      end
    end
  end
  max_player
end

def winning_team
  home_points = 0
  away_points = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players && location == :home
        data.each do |player, stats|
          home_points += stats[:points]
        end
      elsif attribute == :players && location == :away
        data.each do |player, stats|
          away_points += stats[:points]
        end
      end
    end
  end
  if home_points > away_points
    return game_hash[:home][:team_name]
  end
  return game_hash[:away][:team_name]
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      if player.length > longest_name.length
        longest_name = player
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  most_steals = 0
  most_steals_name = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      if stats[:steals] > most_steals
        most_steals = stats[:steals]
        most_steals_name = player
      end
    end
  end
  if most_steals_name == longest_name
    return true
  end
  return false
end
