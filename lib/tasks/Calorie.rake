namespace :calorie do
    task read: :environment do
       # Part 1
        elf = []
      elf = open("lib/data/input.txt").read
        elf = elf.split("\n\n")

        result = elf.map do |elfs|
            elf_inventory = elfs.split("\n").map(&:to_i).sum
        end 
        puts result.max
        # Part 2
        puts result.max(3).sum
    end
  end