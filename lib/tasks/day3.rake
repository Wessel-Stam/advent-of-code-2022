namespace :rucksack do
    task read: :environment do
        total = []
       # Part 1
    inventory = open("lib/data/day3.txt").read
    cases = ('a'..'z').to_a + ('A'..'Z').to_a
    inventory.split("\n").map do |inventorys|
      backpack = inventorys.chars.each_slice(inventorys.length / 2).map(&:join)
        backpack[0].split('').each do |contents|
            cases_priority = cases.index(contents) + 1
            if backpack[1].include?(contents)  
                total << cases_priority
                puts total.sum
                puts '--------'
                break
            end
        end
    end
       # Part 2
       array = []
       total_badges = []
       array = inventory.split("\n")
        array.each_slice(3) do |contents|
            contents[0].split('').each do |content|
                cases_priority = cases.index(content) + 1
                if contents[1].include?(content) && contents[2].include?(content)
                    total_badges << cases_priority
                    puts total_badges.sum
                    break
                end
            end
         end
    end
  end