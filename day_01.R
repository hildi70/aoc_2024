input <- read.table(file = "input/day_01.txt")

# part 01
# find the difference between numbers according to their rank
# (e.g. the difference between the smallest number on the left and the
# smallest number on the right.)

left <- sort(input$V1)
right <- sort(input$V2)
diff <- abs(left - right)
sum(diff) #1830467

# part 02
# multiple the number on the left with how often it occurs on the right 

counts <- table(right)
left <- left[left %in% right]

sum(counts[names(counts) %in% left] * left) #26674158

