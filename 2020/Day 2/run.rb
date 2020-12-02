class Day2
  attr_reader :input

  def initialize
    @input = File.read('input.txt').split("\n")
  end

  def call
    return input.count do |line|
      range, char, password = line.split("\s")

      range = range.split("-").map(&:to_i)
      char = char.chop

      # puts "[" + char + "]" + "[" + password[range.first-1] + "]" + "[" + password[range.last-1] + "]"

      (password[range.first - 1] == char || password[range.last - 1] == char) &&
        !(password[range.first - 1] == char && password[range.last - 1] == char)
    end
  end
end

puts Day2.new.()
