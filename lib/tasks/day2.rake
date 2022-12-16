namespace :game do
    task read: :environment do
      strategy = open("lib/data/day2.txt").read
      # Part 1
      mappings = {
        "A" => 0,
        "B" => 1,
        "C" => 2,
        "X" => 0,
        "Y" => 1,
        "Z" => 2
    }
    # Part 2
    match_2 =[
        [(3+0), (1+3), (2+6)], #A
        [(1+0), (2+3), (3+6)], #B
        [(2+0), (3+3), (1+6)] #C``
    ]
    number_split = strategy.split("\n")
    point_all_2 = number_split.map do |number|
        elfs, me  = number.split(" ")
        match_2[mappings[elfs]][mappings[me]]
    end
    puts point_all_2.sum
    end
end
