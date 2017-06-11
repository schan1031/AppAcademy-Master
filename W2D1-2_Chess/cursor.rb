require "io/console"

KEYMAP = {
  " " => :space,
  "h" => :left,
  "j" => :down,
  "k" => :up,
  "l" => :right,
  "w" => :up,
  "a" => :left,
  "s" => :down,
  "d" => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c,
}

MOVES = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0]
}

class Cursor

  attr_reader :cursor_pos, :board, :selected_piece

  def initialize(cursor_pos, board)
    @toggle = false
    @cursor_pos = cursor_pos
    @board = board
    @selected_piece = []
  end

  def get_input
    key = KEYMAP[read_char]
    handle_key(key)
  end

  private

  def read_char
    STDIN.echo = false # stops the console from printing return values

    STDIN.raw! # in raw mode data is given as is to the program--the system
                 # doesn't preprocess special characters such as control-c

    input = STDIN.getc.chr # STDIN.getc reads a one-character string as a
                             # numeric keycode. chr returns a string of the
                             # character represented by the keycode.
                             # (e.g. 65.chr => "A")

    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil # read_nonblock(maxlen) reads
                                                   # at most maxlen bytes from a
                                                   # data stream; it's nonblocking,
                                                   # meaning the method executes
                                                   # asynchronously; it raises an
                                                   # error if no data is available,
                                                   # hence the need for rescue

      input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true # the console prints return values again
    STDIN.cooked! # the opposite of raw mode :)

    return input
  end

  def handle_key(key)
    case key
    when :return, :space
      select_drop
      @cursor_pos
    when :left, :right, :up, :down
      update_pos(MOVES[key])
      nil
    when :ctrl_c
      Process.exit(0)
    end

  end

  def update_pos(diff)
    row = @cursor_pos[0] + diff[0]
    col = @cursor_pos[1] + diff[1]

    if @board.in_bounds?([row, col])
      @cursor_pos[0], @cursor_pos[1] = row, col
    end
  end

  def select_drop
    return if @board[@cursor_pos].is_a?(NullPiece) && @selected_piece.empty?
    if @selected_piece.empty?
      @selected_piece << board[@cursor_pos]
    elsif @selected_piece[0].moves.include?(@cursor_pos)
      board[@selected_piece[0].pos] = NullPiece.instance

      unless board[@cursor_pos].is_a?(NullPiece)
        board.white_taken << board[@cursor_pos] if board[@cursor_pos].color == 'black'
        board.black_taken << board[@cursor_pos] if board[@cursor_pos].color == 'white'
      end
      board[@cursor_pos] = @selected_piece.pop
      board[@cursor_pos].pos = @cursor_pos.dup
    else
      @selected_piece.pop
      nil
    end
  end
end
