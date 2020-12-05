class Day6
  attr_reader :input

  def initialize
    @input = File.read('input.txt').split("\n\n")
  end

  def call
    input.sum do |group|
      group_size = group.split("\n").length
      group.
	split("\n").
	map(&:chars).
	flatten.
	tally.
	reject { |k,v| v != group_size }.
	count
    end
  end
end

puts Day6.new.()
