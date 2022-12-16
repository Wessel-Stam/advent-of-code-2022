namespace :signal do
    task read: :environment do
       # Part 1

       #set up variables
       left = 0
       right = 0
       string = ''

       # get the base string from the file
       signal = File.read('lib/tasks/day6.txt')
       # iterate through the string
       while right < signal.length - 1 do
         if string.length == 14
           puts right
           break
         end

         # if the current string includes the next character, reset the current string and move the left pointer
         if string.include?(signal[right])
           string = ''
           left += 1
           right = left
         else
           string << signal[right]
           right += 1
         end
       end
        # Part 2
       
    end
  end