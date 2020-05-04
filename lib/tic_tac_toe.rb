
class TicTacToe
  attr_reader :winner
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(position, xoro)
    @board[position] = xoro
  end

  def position_taken?(value)
    ((@board[value] == "X") || (@board[value] == "O"))
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    turns = 0
    @board.each do |moves|
      if moves == "X" || moves == "O"
        turns += 1
      end
    end
    turns
  end
  def current_player
    if turn_count % 2 == 0
    "X"
    else
    "O"
    end
  end

  def turn
    puts "Please choose a number 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index, token)
      puts display_board
    else
      turn
    end
  end

  def won?
  WIN_COMBINATIONS.detect do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      @winner = "X"
      return win_combo
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
      @winner = "O"
      return win_combo
    end
      @winner = nil
      false
  end
end
  def full?
    @board.all? {|index| index == "X" || index == "O"}
  end

  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end

  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end

    def winner
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
        return "X"
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return "O"
      else
        nil
      end
    end
  end
  def play
  while over? == false
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end
end
