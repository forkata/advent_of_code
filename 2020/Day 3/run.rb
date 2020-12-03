class Day3
  attr_reader :input

  def initialize
    @input = File.read('input.txt').split("\n")
  end

  def call
    trees = 0
    column, row = 0, 0

    map_width = input.first.length
    map_length = input.length

    loop do
      if column + 3 < map_width
        column += 3
      else
        # wrap around
        column = (column + 3) - map_width
      end
      row += 1

      break unless row < map_length

      current_tile = input[row][column]
      # puts "row #{row} column #{column} tile [#{current_tile}]"

      if current_tile == "#"
        trees += 1
      end
    end

    return trees
  end
end

puts Day3.new.()
