class Day5
  attr_reader :input

  def initialize
    @input = File.read('input.txt').split("\n")
  end

  def call
    # Rows - 0 - 127
    #
    # First 8: F means "front", B means "back",
    input.map do |seat|
      lower = 0.0
      upper = 127.0

      # find row
      seat[0..8].chars.each do |input|
        case input
        when 'F'
          # lower stays the same
          distance = ((upper - lower) / 2.0).round(half: :up)
          upper -= distance.to_f
        when 'B'
          distance = ((upper - lower) / 2.0).round(half: :up)
          lower += distance.to_f
        end

        # puts "[#{input}] lower #{lower} - upper #{upper}"
      end

      row = lower

      lower = 0.0
      upper = 7.0

      # Last 3: Columns - 0 - 8
      # L means "left", and R means "right".
      # L - lower | R - upper
      seat[7..11].chars.each do |input|
        case input
        when 'L'
          # lower stays the same
          distance = ((upper - lower) / 2.0).round(half: :down)
          upper -= distance.to_f
        when 'R'
          distance = ((upper - lower) / 2.0).round(half: :up)
          lower += distance.to_f
        end

        # puts "[#{input}] lower #{lower} - upper #{upper}"

      end

      column = lower

      row * 8 + column
    end.max
  end
end

puts Day5.new.()
