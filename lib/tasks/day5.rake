namespace :crates do
  task read: :environment do
     # Part 1
     crates = [[], [], [], [], [], [], [], [], []]
     mapping = [1, 5, 9, 13, 17, 21, 25, 29, 33]
     
     File.readlines('lib/tasks/data.txt').each do |line|
       # Store the layout of the crates
       if line.include?('[')
         mapping.each_with_index do |v, k|
           crates[k].push(line[v]) if line[v] && !line[v].strip.empty?
         end
       elsif line.include?('move')
         # scan returns all results from a regex in an array, the regex
         # simply extracts the values between any square brackets
         # e.g. "test 5 test 6" would result in ["5", "6"]
         amount, from, to = line.scan(/\d+/).map(&:to_i)
         
         crates_to_move = crates[from - 1].shift(amount)
         crates[to - 1] = crates_to_move.concat(crates[to - 1])
       end
     end
     
     crates.each do |c|
       puts c[0]
     end
      # Part 2
  end
end