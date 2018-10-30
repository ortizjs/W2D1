#Updated with this comment
class Board
  attr_accessor :piece

  def default_grid
    grid = Array.new(8) {Array.new(8)}
  end

  def set_up_board
    rows_to_set = [0, 1, 6, 7]
    @grid.each_with_index do |row, idx|
      row.each_with_index do |col, idx2|
        if rows_to_set.include?(idx)
          pos = @piece
        else
          pos = nil
        end
      end
    end
    @grid
  end

  def initialize
    @grid = self.default_grid.set_up_board
  end

  def pos=(value)
    pos = row, col
    value = @piece
  end

  def move_piece(start_pos, end_pos)
    #check whether the piece can move there
    #check if the spot is occupied by its team piece
    #move piece if two cases pass else raise exception
    #render board with new piece position
    if !start_pos.nil?
      raise "0"
    elsif !end_pos.nil? && end_pos.include?(teampiece)
      raise "1"
    else
      update_board(end_pos)
    end
  end

  def update_board(pos)
  end

  def start_pos
  end

  def occupied?
  end

  # def gets_move
  #   gets.chomp.split(",")     #In the game itself
  # end
  #
end

class Piece
  def initialize(piece)
    @piece = piece
  end
end

class NullPiece < Piece
  def initialize(piece)
    super(piece) = nil
  end
end
