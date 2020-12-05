class Day6
  attr_reader :input

  def initialize
    @input = File.read('input.txt').split("\n\n")
  end

  def call
    input.sum do |group|
			group.
				split("\n").
				map(&:chars).
				flatten.
				uniq.
				count
    end
  end
end

puts Day6.new.()
