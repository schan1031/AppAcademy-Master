require 'byebug'
require 'singleton'

class Piece
  attr_reader :color, :moves
  attr_accessor :pos
  def initialize(pos = nil, color = nil, board)
    @pos = pos
    @board = board
    @color = color
    @moves = []
  end

  def moves
    return [] if self.is_a?(NullPiece)
    deltas = move_dirs
    @moves = []
    deltas.each do |direction|
      direction.each do |del|
        end_pos = [pos[0] + del[0], pos[1] + del[1]]
        case valid_move(end_pos)
        when -1, 0
          next if self.is_a?(Knight) || self.is_a?(King)
          break
        when 1
          @moves << end_pos
          break unless self.is_a?(Knight) || self.is_a?(King)
        when 2
          @moves << end_pos
        end
      end
    end
    @moves
  end

  def valid_move(end_pos)
    return -1 unless end_pos.all? { |el| el.between?(0, 7) }
    return 0 if @board[end_pos].color == self.color
    return 1 unless @board[end_pos].color.nil?
    return 2
  end
end


module SlidingPiece
  def move_dirs
    delta_arr = []

    # Vertical/Horizontal Movement
    delta_arr << (-7..-1).to_a.reverse.zip(Array.new(7) {0}) if self.is_a?(Rook) || self.is_a?(Queen)
    delta_arr << (1..7).to_a.zip(Array.new(7) {0}) if self.is_a?(Rook) || self.is_a?(Queen)
    delta_arr << Array.new(7) {0}.zip((-7..-1).to_a.reverse) if self.is_a?(Rook) || self.is_a?(Queen)
    delta_arr << Array.new(7) {0}.zip((1..7).to_a) if self.is_a?(Rook) || self.is_a?(Queen)

    # Diagonals
    delta_arr << (-7..-1).to_a.zip((-7..-1).to_a).reverse if self.is_a?(Bishop) || self.is_a?(Queen)
    delta_arr << (1..7).to_a.zip((1..7).to_a) if self.is_a?(Bishop) || self.is_a?(Queen)
    delta_arr << (-7..-1).to_a.zip((1..7).to_a.reverse).reverse if self.is_a?(Bishop) || self.is_a?(Queen)
    delta_arr << (1..7).to_a.zip((-7..-1).to_a.reverse) if self.is_a?(Bishop) || self.is_a?(Queen)


    delta_arr
  end
end

module SteppingPiece

  def move_dirs
    delta_arr = []
    # Pawn
    pawn_arr = []
    pawn_arr << [-1, 0] if self.color == 'white' && self.is_a?(Pawn)
    pawn_arr << [1, 0] if self.color == 'black'  && self.is_a?(Pawn)
    pawn_arr << [-2, 0] if self.color == 'white' && self.pos[0] == 6 && self.is_a?(Pawn)
    pawn_arr << [2, 0] if self.color == 'black' && self.pos[0] == 1 && self.is_a?(Pawn)
    delta_arr << pawn_arr if self.is_a?(Pawn)

    # Knight
    delta_arr << [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]] if self.is_a?(Knight)

    # King
    delta_arr << [[1, 0], [1, 1], [1, -1], [0, 1], [0, -1], [-1, 1], [-1, 0], [-1, -1]] if self.is_a?(King)
    delta_arr
  end
end

class NullPiece < Piece
  include Singleton
  def initialize
  end
end

class Rook < Piece
  include SlidingPiece
end

class Bishop < Piece
  include SlidingPiece
end

class Queen < Piece
  include SlidingPiece
end

class Knight < Piece
  include SteppingPiece
end

class Pawn < Piece
  include SteppingPiece
end

class King < Piece
  include SteppingPiece
end
