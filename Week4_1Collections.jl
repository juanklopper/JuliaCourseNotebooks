# COLLECTIONS
# -----------

# * Collections are groups of elements
# * Elements are values of different Julia data types
# * Storing elements in collections is one of the most useful
#    operations in computing

# I ARRAYS

# *  Arrays are collections of values separated with commas and
#     them inside of square brackets
# * They are represented in column or in row form

# 1 Like a column vector (click on the downward arrow)
array1 = [1, 2, 3]
typeof(array1)

# 2 Like row vector (click on the downward arrow)
array2 = [1 2 3]
typeof(array2)

# 3 The transpose converts betwee the two
transpose(array1)
#The apostrophe is an alternative notation
array1'

# 4 Boolean logic (==)
transpose(array1) == array1'

# 5 Data type inheritance
#With a mix of types, all the elements inherent the "highest" type
array2 = [1, 2, 3.0]
#Index for one of the original integers will be Float64
array2[1]

# 6 Column-wise entry of multidimensional array
array3 = [[1, 2, 3] [4, 5, 6] [7, 8, 9]]

# 7 Row-wise entry of multidimensional array
array4 = [[1 2 3]; [4 5 6]; [7 8 9]]

# 8 Length of array
length(array3)
length(array4)

# 9 Index order of column-wise array
for i in 1:length(array3)
    println("Element $(i) is ", array3[i])
end

# 10 Index order of row-wise array
for i in 1:length(array4)
    println("Element $(i) is ", array4[i])
end

# 11 Using repeat() to repeat elements
repeat([1, 2], 3)

# 12 Using range(start, step, number of elements)
range(1, step = 1, length = 10)
typeof(range(1, step = 1, length = 10))

# 13 Create collections usin gthe collect() function
collect(range(1, step = 1, length = 10))
#Short-hand
collect(1:10)
typeof(1:10)
#Add step size
collect(2:2:10)
typeof(collect(2:2:10))

# 14 Creating empty array with two rows and three columns
array5 = Array{Union{Missing, Int}}(missing, 2, 3)

# 15 Reshaping
reshape(array5, 3, 2)

# 16 Indexing (slicing)
#Random uniform distribution of values in closed domain [10,20]
#Shape 10 x 5
array6 = rand(10:20, 10, 5)
#All rows in first column
array6[:, 1]
#Rows two through five of second column
array6[2:5, 2]
#Values in rows 2, 4, 6, and in columns 1 and 5
array6[[2, 4, 6], [1, 5]]
#Values in row 1 from column 3 to the last column
array6[1, 3:end]
# Boolean logic (returning only true and false)
array6[:, 1] .> 12

# 17 Changing element values
array7 = [1, 2, 3, 4, 5]
#Permanantly append 10 to end of array
push!(array7, 10)
#Remove last element
#Only the removed value will be displayed
pop!(array7)
array7
#Change second element value to 1000
array7[2] = 1000
array7

# 18 List comprehension
array8 = [3 * i for i in 1:5]
#Column-wise collection iterating through second element first
array9 = [a * b for a in 1:3, b in 1:3]


# 19 Arithmetic on arrays
#Elementwise addition of a scalar using dot notation
array8 .+ 1
#Elementwise addition of similar sized arrays
array7 + array8

# 20 Missing
# * Missing is a Julia data type
# * Provides a placeholder for missing data in a statistical sense
# * Propagates automatically
# * Equality as a type can be tested
# * Sorting is possible since missing is seen as greater than other values

#Propagation
missing + 1
missing > 1
[1, 2, 3, missing, 5] + [10, 20, 30, 40 ,50]
#Cannot return true or false since value is not known
missing == missing
#Equality
missing === missing
isequal(missing, missing)
#Sorting with isless()
isless(1, missing)
isless(Inf, missing)

# 21 Array of integer zeros
array11 = zeros(Int8, 3, 3)

# 22 Array of floating point ones
array12 = ones(Float16, 3, 3)

# 23 Array of true (bit array) values
array13 = trues(3, 3)

# 24 Fill an array with n elements of value x
array14 = fill(10, 3, 3)

# 25 Convert elements to a different data type
convert.(Float16, array14)

# 26 Concatenation
#Concatenate arrays along rows (makes row)
array15 = [1, 2, 3]
array16 = [10, 20, 30]
cat(array15, array16, dims = 1)
#Same as above
vcat(array15, array16)
#Concatenate arrays along columns (makes colums)
cat(array15, array16, dims = 2)
#Same as above
hcat(array15, array16)

# II TUPLES

# * Tuples are immutable collections

# 1 Tuples with mixed types
tuple1 = (1, 2, 3, 4, "Julia")
#For loop to look at value and type of each element
for i in 1:length(tuple1)
    println(" The value of the tuple at index number $(i) is $(tuple1[i]) and the type is $(typeof(tuple1[i])).")
end

# 2 Each element can be named
a, b, c, seven = (1, 3, 5, 7)
a
seven

# 2 Reverse order index (can be done with arrays too)
tuple1[end:-1:1]

# 3 Mixed length tuples
tuple2 = ((1, 2, 3), 1, 2, (3, 100, 1))
#Element 4
tuple2[4]
#Element 2 in element 4
tuple2[4][2]

# III DICTIONARIES

# * Dictionaries are collection sof key-value pairs

# 1 Example of a dictionary
dictionary1 = Dict(1 => 77, 2 => 66, 3 => 1)
#The => is shorthand for the Pair() function
dictionary2 = Dict(Pair(1,100), Pair(2,200), Pair(3,300))

# 2 Specifying types
dictionary3 = Dict{Any, Any}(1 => 77, 2 => 66, 3 => "three")
#We can get a bit crazy
dictionary4 = Dict{Any, Any}("a" => 1, (2, 3) => "hello")

# 3 Using symbols as keys
dictionary5 = Dict(:A => 300, :B => 305, :C => 309)
dictionary5[:A]

# 4 Using in() to check on key-value pairs
in((:A => 300), dictionary5)

# 5 Changing an existing value
dictionary5[:C] = 1000
dictionary5

# 6 Using the delete!() function
delete!(dictionary5, :A)

# 7 The keys of a dictionary
keys(dictionary5)

# 8 The values of a dictionary
values(dictionary5)

# 8 Creating a dictionary with automatic keys
procedure_vals = ["Appendectomy", "Colectomy", "Cholecystectomy"]
procedure_dict = Dict{AbstractString,AbstractString}()
for (s, n) in enumerate(procedure_vals)
    procedure_dict["x_$(s)"] = n
end
#Procedure_dict is now a dictionary
procedure_dict

# 9 Iterating through a dictionary by key and value
for (k, v) in procedure_dict
    println(k, " is ",v)
end

# 10 Sorting
dictionary6 = Dict("a"=> 1,"b"=>2 ,"c"=>3 ,"d"=>4 ,"e"=>5 ,"f"=>6)
# Sorting using a for loop
for k in sort(collect(keys(dictionary6)))
    println("$(k) is $(dictionary6[k])")
end
