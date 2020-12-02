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
      occurrences = password.scan(char)
      count = occurrences.count

      puts [
        range.to_s,
        " [" + char + "] ",
        " [" + password + "]",
        " occurences: " + count.to_s
      ].join

      count.between?(range.first, range.last)
    end
  end
end

puts Day2.new.()
