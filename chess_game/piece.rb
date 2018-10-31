require_relative "board.rb"

module SteppingPiece #King, Knight
  MOVES = [
    [1, y],
    [-1, -y],
    [-x, 1],
    [x, -1]
  ]

  def move_dirs(pos)
    possibilities = []
    moves.each do |move|
      if MOVES.include?(move)
        possibilities << move
      end
    end
    possibilities
  end

end

class King < Piece
  include SteppingPiece
  x == 1 || y ==1 || x == 0 || y == 0
end

class Knight < Piece
  include SteppingPiece
  x == 2 || y == 2
end

module SliddingPiece #Queen, Rook. Bishop
  def move_dirs
  end
end

class Piece
  attr_reader :value
  def initialize(piece)
    @piece = piece
    @value = "P"
  end

  def moves
    places = []
    @board.grid.each_index do |row|
      row.each_index do |col|
        move = @board[row][col]
        if valid_move?(move)
          places << move
        end
      end
    end
    places
  end
end

class NullPiece < Piece
  include Singleton

  def initialize
    @value = "X"
  end
end

class Pawns < Piece
end


class Queen < Piece
  include SliddingPiece
end

class Bishop < Piece
  include SliddingPiece
end

class Rook < Piece
  include SliddingPiece
end
