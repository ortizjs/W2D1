require "byebug"
require "singleton"
# require "colorized"
require_relative "display.rb"
require_relative "cursor.rb"

#Updated with comment
class Board

  attr_reader :piece, :grid

  def initialize
    @grid = Array.new(8) {Array.new(8)}
    @sentinel = NullPiece.instance
    set_up_board
  end

  def [](pos)
    # debugger
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def valid_pos?(pos)
    if (pos[0] < 0 || pos[1] > 7) || (pos[0] > 7 || pos[1] < 0)
      return false
    end
    true
  end


  def move_piece(start_pos, end_pos)
    # debugger
    if self[start_pos].is_a?(NullPiece)
      raise "There is no piece to move at that starting position"
    end
    if !self[end_pos].is_a?(NullPiece)
      raise "The piece canot be moved to that end position"
    end
    update_board(start_pos, end_pos)
  end

  def update_board(old_pos, new_pos)
    old_piece = self[old_pos]
    self[old_pos] = @sentinal
    self[new_pos] = old_piece
  end

  def set_up_board
    occupy_rows = [0, 1, 6, 7]
    @grid.each_with_index do |row,idx|
      if occupy_rows.include?(idx)
        row.each_index do |idx2|
          @grid[idx][idx2] = Piece.new('p')
        end
      else
        row.each_index do |idx2|
          # debugger
          @grid[idx][idx2] = @sentinel
        end
      end
    end
  end
end

class Piece
  attr_reader :value
  def initialize(piece)
    @piece = piece
    @value = "P"
  end

  # def inspect
  #
  # end
end

class NullPiece < Piece
  include Singleton

  def initialize
    @value = "x"
  end

  # def inspect
  #   "X"
  # end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new()
  p board.render
  board.move_piece([0,0], [1,0])
  p "move after"
  Display.render
end
