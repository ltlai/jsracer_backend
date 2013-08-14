$(document).ready(function() {

  var position_1 = 1;
  var position_2 = 1;
  var winner = 0;
 
  var player1_id = $("tr#player1_strip").attr("player-id");
  var player2_id = $("tr#player2_strip").attr("player-id");
  var start_time = new Date().getTime();
  
  $(document).on('keyup', function(event) {
 
    var move = function(player, position) {
      $("table tr:nth-child(" + player + ") td").removeClass("active")
      $("table tr:nth-child(" + player + ") td:nth-child(" + position + ")").addClass("active")
    }
 
    if (event.keyCode == 32) {
      position_1 +=1
      move(1, position_1);
    }
 
    if (event.keyCode == 39) {
      position_2 += 1
      move(2, position_2);
    }
     
    if (position_1 === 10) {
      winner = 1
      alert("Player 1 won!")
      $(document).off('keyup');
    }
    if (position_2 === 10) {
      winner = 2
      alert("Player 2 won!")
      $(document).off('keyup');
    }

    if (winner) {
      console.log("There is a winner!")
      game_id_str = window.location.pathname.split('/').pop();
      game_id = parseInt(game_id_str)
      winning_time = new Date().getTime() - start_time;
      var game_stats = {
        game_id: game_id, 
        winner_id: (winner == 1 ? player1_id : player2_id),
        winning_time: winning_time
      }
      $.ajax({
        type: "POST",
        url: '/games/stats',
        dataType: "json",
        data: game_stats
      }).done(function(data) {
        $('#stats').show();
      })
    }
  });

});