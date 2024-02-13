require 'colorize'

module Messages

  def introduction
    intro = <<~HEREDOC
      Welcome to Chess! A battle of brains involving two players.

      To begin, select what you would like to do:
        #{"[1]".light_cyan} Play a head-to-head 2 Player Game
        #{"[2]".light_cyan} Play a game against the computer
        #{"[3]".light_cyan} Load a previously played game
      HEREDOC
  end

  def instructions
    instructions = <<~HEREDOC
      Each turn will consist of two selections.
      Each Selection will be made using algebraic notation, using
      letters to select the columns, and numbers to select the rows,
      with no spaces in between.
      (Example: A6 or a6)

      #{"First Selection".light_red}:
        Select which piece you would like to move. You will be told if
        the piece is unable to be selected, and why it is not able to be
        selected if you can't.

      #{"Second Selection".light_red}:
        Select where you would like to move the piece. This will allow
        castling, en passant, and pawn upgrades when possible.

      During either of your selections, aside from typing which piece
      you would like to select, you will have other options available
      to you. You may type any of the following to perform any of the
      following commands:
          #{"back".light_red}: This will allow you to unselect a piece you
                have selected and select another piece
          #{"save".light_red}: This will save your current progress and
                ask you if you would like to quit or continue
          #{"resign".light_red}: You concede the game 
          #{"quit".light_red}: This will quit the program without saving
          #{"help".light_red}: This will display these instructions again
      HEREDOC
  end

  def player_setup_intro
    <<~HEREDOC
    
      Alright let's get each player set up with names and colors.

      Player 1, please enter your name:
    HEREDOC
  end

  def player_two_setup
    <<~HEREDOC

      Thanks for entering your name!

      Player 2, please enter your name:
    HEREDOC
  end

  def assign_player_colors_message(player_one_name, player_two_name)
    <<~HEREDOC

      Thanks #{player_one_name} and #{player_two_name}! Now let's get your colors assigned at random. 
      Once the colors have been chosen, white will go first.

    HEREDOC
  end

  def announce_white(player_name)
    <<~HEREDOC

      #{player_name}, you are white, that means you go first!

    HEREDOC
  end
end