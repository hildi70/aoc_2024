library(stringr)

input <- readLines("input/day_03.txt")
input <- gsub("[\r\n\\s+]", "", input)

# part 01
extracted <- unlist(str_extract_all(input, "(?<=mul\\()[0-9]*,[0-9]*(?=\\))"))
numbers <- strsplit(extracted, ",")
numbers <- lapply(numbers, function(x) as.numeric(x))

numbers_prod <- list()

for (i in seq_along(numbers)) {
  numbers_prod[[i]] <- prod(numbers[[i]])
}

sum(unlist(numbers_prod)) #173529487

# part 02
input <- paste0(unlist(str_extract_all(input, "do\\(\\)|don't\\(\\)|mul\\([0-9]*,[0-9]*\\)")),
                collapse = "")
input <- paste0("do()", input, "don't()")


dos <- unlist(str_extract_all(input, "(?<=do\\(\\)).+?(?=don't\\(\\))"))

extracted_dos <- unlist(str_extract_all(dos, "(?<=mul\\()[0-9]*,[0-9]*(?=\\))"))
numbers_dos <- strsplit(extracted_dos, ",")
numbers_dos <- lapply(numbers_dos, function(x) as.numeric(x))


numbers_prod_dos <- list()

for (i in seq_along(numbers_dos)) {
  numbers_prod_dos[[i]] <- prod(numbers_dos[[i]])
}

sum(unlist(numbers_prod_dos)) #99532691
