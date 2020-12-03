class Day3
  attr_reader :input

  def initialize
    @input = File.read('input.txt').split("\n")
  end

  def call
    return traverse(1, 1) *
      traverse(3, 1) *
      traverse(5, 1) *
      traverse(7, 1) *
      traverse(1, 2)
  end

  def traverse(right, down)
    trees = 0
    column, row = 0, 0

    map_width = input.first.length
    map_length = input.length

    loop do
      if column + right < map_width
        column += right
      else
        # wrap around
        column = (column + right) - map_width
      end
      row += down

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
