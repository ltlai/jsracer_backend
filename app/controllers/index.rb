get '/' do
  erb :index
end

post '/games/new' do
  player_1 = Player.find_or_create_by!(name: params[:player1])
  player_2 = Player.find_or_create_by!(name: params[:player2])
  game = Game.new
  game.players << player_1
  game.players << player_2
  game.save!
  redirect "/games/#{game.id}"
end

get '/games/:id' do
  @game = Game.find(params[:id])
  erb :game
end

post '/games/stats' do
  game = Game.find(params[:game_id])
  game.winner_id = params[:winner_id]
  game.winning_time = params[:winning_time]
  game.save!
  game.to_json
end

get '/games/:id/stats' do
  @game = Game.find(params[:id])
  erb :game_stats
end