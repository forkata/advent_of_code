class Day1
  attr_reader :input

  def initialize
    @input = File.read('input.txt').split("\n").map(&:to_i)
  end

  def call
    input.each_with_index do |first, first_index|
      input.each_with_index do |second, second_index|
        input.each_with_index do |third, third_index|
          # don't try to add a number to itself
          next if [first_index, second_index, third_index].uniq.length < 2
          next unless first + second + third == 2020

          puts first.to_s + " " + second.to_s + " " + third.to_s
          return first * second * third
        end
      end
    end
  end
end

puts Day1.new.()
