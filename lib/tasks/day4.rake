#check if 2 ranges overlap 
namespace :assignment do
    task read: :environment do
        ranges = open("lib/data/day4.txt").read
        
        ranges.split(",").map do |range|
            # # check if 2 ranges overlap
        puts first_range = range.split("-")[0].to_i
           puts second_range = range.split("-")[1].to_i
            range1 = (first_range[0]..first_range[1])
            range2 = (second_range[0]..second_range[1])
            if range1.include?(range2)
                puts "Overlap"
            else
                puts "No Overlap"
            end
        end



        
    # range1 = (first_range[0]..first_range[1])
    # range2 = ()

    # if range1.overlaps?(range2)
    #   puts "Overlap"
    # else
    #   puts "No Overlap"
    # end
  end
end
