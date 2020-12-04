class Day4
  attr_reader :input

  def initialize
    @input = File.read('input.txt').split("\n\n")
  end

  def call
    input.count do |passport|
      passport_hash = Hash[
        passport.split(/\s|\n/).map do |field|
          field.split(":")
        end
      ]
      height = passport_hash["hgt"]
      (%w(byr iyr eyr hgt hcl ecl pid) - passport_hash.keys).empty? &&
        ((1920..2002) === passport_hash["byr"].to_i) &&
        ((2010..2020) === passport_hash["iyr"].to_i) &&
        ((2020..2030) === passport_hash["eyr"].to_i) &&
        ((height =~ /cm$/ &&
          (height_cm = height.tr("cm", "").to_i) &&
          height_cm >= 150 && height_cm <= 193) ||
         (height =~ /in$/ &&
          (height_in = height.tr("in", "").to_i) &&
          height_in >= 59 && height_in <= 76)) &&
         passport_hash["hcl"].match(/^#[0-9a-f]{6}$/) &&
         %w(amb blu brn gry grn hzl oth).include?(passport_hash["ecl"]) &&
         passport_hash["pid"].match(/^[0-9]{9}$/)
    end
  end
end

puts Day4.new.()
