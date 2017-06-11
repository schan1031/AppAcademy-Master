require_relative 'piece.rb'
require_relative 'display.rb'
require 'byebug'

class Board
  # debugger
  attr_accessor :grid, :white_taken, :black_taken
  def initialize
    @kings = []
    @grid = populate_board
    @white_taken = []
    @black_taken = []
  end

  def populate_board
    # rows 0 and 1 => white pieces
    # rows 6 and 7 => black pieces
    @grid = Array.new(8) {Array.new(8)}
    (0..7).each do |row|
        @grid[row] = Array.new(8) {NullPiece.instance}
    end


    (0..7).each do |row|
      if row == 0
        @grid[row][0] = Rook.new([row, 0], "black", self)
        @grid[row][1] = Knight.new([row, 1], "black", self)
        @grid[row][2] = Bishop.new([row, 2], "black", self)
        @grid[row][3] = Queen.new([row, 3], "black", self)
        @kings << King.new([row, 4], "black", self)
        @grid[row][4] = @kings[0]
        @grid[row][5] = Bishop.new([row, 5], "black", self)
        @grid[row][6] = Knight.new([row, 6], "black", self)
        @grid[row][7] = Rook.new([row, 7], "black", self)
      elsif row == 1
        @grid[row][0] = Pawn.new([row, 0], "black", self)
        @grid[row][1] = Pawn.new([row, 1], "black", self)
        @grid[row][2] = Pawn.new([row, 2], "black", self)
        @grid[row][3] = Pawn.new([row, 3], "black", self)
        @grid[row][4] = Pawn.new([row, 4], "black", self)
        @grid[row][5] = Pawn.new([row, 5], "black", self)
        @grid[row][6] = Pawn.new([row, 6], "black", self)
        @grid[row][7] = Pawn.new([row, 7], "black", self)
      elsif row == 6
        @grid[row][0] = Pawn.new([row, 0], "white", self)
        @grid[row][1] = Pawn.new([row, 1], "white", self)
        @grid[row][2] = Pawn.new([row, 2], "white", self)
        @grid[row][3] = Pawn.new([row, 3], "white", self)
        @grid[row][4] = Pawn.new([row, 4], "white", self)
        @grid[row][5] = Pawn.new([row, 5], "white", self)
        @grid[row][6] = Pawn.new([row, 6], "white", self)
        @grid[row][7] = Pawn.new([row, 7], "white", self)
      elsif row == 7
        @grid[row][0] = Rook.new([row, 0], "white", self)
        @grid[row][1] = Knight.new([row, 1], "white", self)
        @grid[row][2] = Bishop.new([row, 2], "white", self)
        @grid[row][3] = Queen.new([row, 3], "white", self)
        @kings << King.new([row, 4], "white", self)
        @grid[row][4] = @kings[1]
        @grid[row][5] = Bishop.new([row, 5], "white", self)
        @grid[row][6] = Knight.new([row, 6], "white", self)
        @grid[row][7] = Rook.new([row, 7], "white", self)
      end
    end
    @grid
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def move_piece(start_pos, end_pos)

    # CHANGE TO SYNTACTIC SUGAR INDEXING
    row1, col1 = start_pos
    row2, col2 = end_pos
    if @grid[row1][col1].is_a?(NullPiece)
      raise ArgumentError.new('No piece at starting position')
    elsif legal_move?(end_pos)
      raise ArgumentError.new('Invalid Move')
    end
    @grid[row2][col2] = @grid[row1][row1]
    @grid[row1][row1] = NullPiece.new
  end

  def legal_move?(end_pos)
    false
  end

  def in_bounds?(pos)
    pos.all? {|el| el.between?(0, 7)}
  end

  def in_check?(color)
    potential_checks = []
    if color == "black"
      @grid.each do |row|
        row.each do |col|
          potential_checks.concat(@grid[row][col].moves) if @grid[row][col].color == "white"
        end
      end
      return true if potential_checks.include?(@kings[0].pos)
    else
      (0..7).each do |row|
        (0..7).each do |col|
          potential_checks.concat(@grid[row][col].moves) if @grid[row][col].color == "black"
        end
      end
      return true if potential_checks.include?(@kings[1].pos)
    end
    false
  end

  def checkmate?(color)
    # in_check?(color) && @kings[0].moves.empty?
  end

end

if __FILE__ == $PROGRAM_NAME
  brd = Board.new
  disp = Display.new(brd)
  while true
    system 'clear'
    disp.render
    disp.cursor.get_input
    break if brd.in_check?("white")
    # disp.render
    # 1
  end
end
