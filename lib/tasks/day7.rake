namespace :file do
    task read: :environment do
        # Part 1
        data = File.readlines('lib/data/day7.txt')
        array = []
        dir_sizes = Hash.new { |h, k| h[k] = 0 }
        data 
            #splits the data into an array of arrays
            .map(&:chomp)
            .map{_1.split(' ')}
            .each do |line|
                case line
                #if the line starts with $ cd .. then pop the last element off the array
                in ['$', 'cd', '..']
                    array.pop
                #if the line starts with $ cd then push the directory name onto the array
                in ['$', 'cd', dir]
                    array << dir
                in ['$', 'ls']
                in ['dir', dirname]
                #if the line starts with a number then add the size to the hash
                in [size, filename]
                    array.length.times do |i|
                    dir_sizes[array[0..i]] += size.to_i
                    end
                end
            p dir_sizes
                #if the size is less than or equal to 100000 then add the size to the sum
                .inject(0) { |sum, (_, size)| size <= 100000 ? sum + size : sum }
        # Part 2

        total = 70000000
        needed = 30000000
        free = total - dir_sizes[['/']]
        delete = needed - free

        puts "Total: #{total}, Needed: #{needed}, Free: #{free}, Delete: #{delete}"

        p dir_sizes.values.sort.find { |size| size >= delete }
        end  
    end
end