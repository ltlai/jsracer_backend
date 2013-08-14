leslie = Player.create(name: "Leslie", password: "foo")
mike = Player.create(name: "Mike", password: "bar")

game1 = Game.create(winner_id: 1, winning_time: 10.012345, results_url: "/games/1/results")
game2 = Game.create(winner_id: 2, winning_time: 12.012345, results_url: "/games/2/results")

GamesPlayer.create(game_id: 1, player_id: 1)
GamesPlayer.create(game_id: 1, player_id: 2)
GamesPlayer.create(game_id: 2, player_id: 1)
GamesPlayer.create(game_id: 2, player_id: 2)


# leslie = Player.create(name: "Leslie", password: "foo")
# mike = Player.create(name: "Mike", password: "bar")
# game1 = Game.new(winning_time: 10.012345)
# # if a game validates on the requirement of having exactly 2 players
# # then it will not save on an empty 'create'
# game1.players << leslie
# game1.players << mike
# game1.save