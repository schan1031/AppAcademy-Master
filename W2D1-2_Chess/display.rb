require 'colorize'
require_relative 'cursor.rb'

PIECE_HASH = {
  "Rookw" => "\u2656",
  "Rookb" => "\u265C",
  "Knightw" => "\u2658",
  "Knightb" => "\u265E",
  "Bishopw" => "\u2657",
  "Bishopb" => "\u265D",
  "Queenw" => "\u2655",
  "Queenb" => "\u265B",
  "Kingw" => "\u2654",
  "Kingb" => "\u265A",
  "Pawnw" => "\u2659",
  "Pawnb" => "\u265F"
}

class Display
  attr_reader :cursor, :board
  def initialize(board)
    @cursor = Cursor.new([1,1], board)
    @board = board
  end

  # def board
  #   @board = @cursor.board
  # end

  def render
    # MAP THE TOP LABELS TO LETTERS
    # puts @cursor.cursor_pos
    print "   0  1  2  3  4  5  6  7\n"
    @board.grid.each_with_index do |row, i|
      print "#{i}  "
      row.each_with_index do |piece, j|
        key = piece.class.to_s + piece.color[0] unless piece.is_a?(NullPiece)
        # if @moves.include?([i, j])
        #
        if [i,j] == @cursor.cursor_pos
          if piece.is_a?(NullPiece)
            (print "-".colorize(:color => :white, :background => :black) + "  ")
          else
            (print PIECE_HASH[key].colorize(:color => :white, :background => :black) + "  ")
          end
        else
          unless @cursor.selected_piece.empty?
            if @cursor.selected_piece[0].moves != nil && @cursor.selected_piece[0].moves.include?([i, j])
              piece.is_a?(NullPiece) ? (print ("-").colorize(:background => :green) + "  ") : (print ("#{PIECE_HASH[key]}").colorize(:background => :green) + "  ")
            else
              piece.is_a?(NullPiece) ? (print "-  ") : (print "#{PIECE_HASH[key]}  ")
            end
          else
            piece.is_a?(NullPiece) ? (print "-  ") : (print "#{PIECE_HASH[key]}  ")
          end
        end
      end
      puts
    end
    # p board.white_taken
    # p board.black_taken
  end
end
