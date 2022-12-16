namespace :trees do
    task read: :environment do
        i = 0
        def visible(y:, x:)
            height = @trees[y][x]
            row = @trees[y]
            col = @trees.transpose[x]
            return true if y.zero? || y == @trees.size - 1 || x.zero? || x == row.size - 1
            return true if height > col[0...y].max
            return true if height > col[y + 1..-1].max
            return true if height > row[x + 1..-1].max
            return true if height > row[0...x].max
            # 3201112303301421031345
            # 32103443435125342455534
            false
        end

        data = File.read('lib/data/day8.txt')

        @trees = data.split("\n").map do |line|
           line.split("").map(&:to_i)
        end

        # @trees.each_with_index do |tree, y|
        #     puts "====="
        #     puts tree[0]



        #     @trees[y].each_with_index do |tree, x|
        #         puts tree
        #         puts "zichtbaar, want bovenste rij" if y == 0
        #         puts "zichtbaar, want onderste rij" if y == @trees.size - 1
        #         puts "-----"
        #         puts "zichtbaar, want eerste kolom" if x == 0
        #         puts "zichtbaar, want laatste kolom" if x == @trees.size - 1
        #         puts "-----"

                
        #     end
        #  end
         


        
        @trees.size.times do |r|
            puts "====="
            puts "rij #{r}"

            @trees[0].size.times do |c|
                if visible(y: r, x: c)
                    puts "#{@trees[r][c]} is visible"
                    puts i += 1
                end
            end

        end

        # trees = trees.flatten
        #  trees.each do |tree|
        #     hoi = tree.split("").map(&:to_i)
        #     stop = hoi.max
        #     puts '--------'
        #  end
    end
  end