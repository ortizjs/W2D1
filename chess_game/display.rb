require "byebug"
require_relative "board.rb"
require "colorize"
require_relative "cursor.rb"

class Display

  attr_reader :board, :cursor

  def initialize
    @board = Board.new
    @cursor = Cursor.new([0,0], @board)
  end

  def render
    rendered = ""
    @board.grid.each_with_index do |row, x|
      row.each_with_index do |col, y|
        # debugger
        if [x,y] == @cursor.cursor_pos
          new_loc = @board[[x,y]].value
          print new_loc.colorize(:red)
        else
          print @board[[x,y]].value
        end
      end
      puts "\n"
    end
    nil
  end

  def test_cursor
    loop do
      user_input = @cursor.get_input
      render
    end
  end

end
