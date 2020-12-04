class Day4
  attr_reader :input

  def initialize
    @input = File.read('input.txt').split("\n\n")
  end

  def call
    input.count do |passport|
      (%w(byr iyr eyr hgt hcl ecl pid) - Hash[
        passport.split(/\s|\n/).map do |field|
          field.split(":")
        end
      ].keys).empty?
    end
  end
end

puts Day4.new.()
