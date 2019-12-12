INPUT = [1,12,2,3,1,1,2,3,1,3,4,3,1,5,0,3,2,6,1,19,1,5,19,23,2,6,23,27,1,27,5,31,2,9,31,35,1,5,35,39,2,6,39,43,2,6,43,47,1,5,47,51,2,9,51,55,1,5,55,59,1,10,59,63,1,63,6,67,1,9,67,71,1,71,6,75,1,75,13,79,2,79,13,83,2,9,83,87,1,87,5,91,1,9,91,95,2,10,95,99,1,5,99,103,1,103,9,107,1,13,107,111,2,111,10,115,1,115,5,119,2,13,119,123,1,9,123,127,1,5,127,131,2,131,6,135,1,135,5,139,1,139,6,143,1,143,6,147,1,2,147,151,1,151,5,0,99,2,14,0,0].freeze

ADD = 1
MULTIPLY = 2
HALT = 99

def execute(program)
  program = program.dup
  pc = 0 # program counter

  while true do
    instruction = program[pc]

    return program if instruction == HALT

    op1_address = program[pc + 1]
    op2_address = program[pc + 2]

    op1 = program[op1_address]
    op2 = program[op2_address]

    result = case instruction
             when ADD
               op1 + op2
             when MULTIPLY
               op1 * op2
             end

    result_address = program[pc + 3]
    program[result_address] = result

    pc = pc + 4
  end
end

def brute_force
  (0..99).each do |noun|
    (0..99).each do |verb|
      program = INPUT.dup
      program[1] = noun
      program[2] = verb

      return [noun, verb] if execute(program)[0] == 19690720
    end
  end
end

# Part 1
puts execute(INPUT)[0]

# Part 2
puts brute_force

