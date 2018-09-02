+(2, 2)
versioninfo()
# FUNCTIONS IN JULIA 1.0 (0.7+)
# ----------------------

# * A function maps a tuple of arguments to a return value

# I Creating basic Functions

# 1 using the function keyword
#Create a function named my_addition
#Takes two arguments
#Return the addition of the two values
function my_addition(x, y)
    return x + y
end

# 2 Calling a function
#Call the function with two argument values
my_addition(3, 4)

# 3 Built-in functions
#The plus, +, symbol (as other arithmetical symbols) are built-in functions
+(3, 4)

# 4 Using a Unicode symbol as a function name
function Σ(x, y)
    return x + y
end

Σ(3, 4)

# II Anonymous functions

# * Functions can be assigned to variables
# * Functions can be used as arguments
# * Functions can be returned as values

# 1 An anonymous function
x -> x^2 + 3

# 2 A function as an argument
#Passing the round() function as argument to the map() function
map(round, [2.1, 3.4, 7.9])
#Passing an anonymous function as an arguemt to the map() function
map(x -> x^2, [2, 3, 4])

# III Tuples and functions

# * Tuples are immutable collections

# 1 Examples of tuples
my_tuple = (1, "Julia", 7)
typeof(my_tuple)

# * Single value tuple must have a comma
my_second_tuple = (4,)
typeof(my_second_tuple)

# 2 Indexing a tuple
length(my_tuple)
my_tuple[2]

# 3 Tuple indexing
# * Named tuple creates a name for each element
my_other_tuple = (a = 4, b = "Julia", c = 3)
#Indexing tuple by name
my_other_tuple.b

# 4 Function returns
# * Multiple return values of a function are tuples
function my_function(a, b)
    return a + b, a - b
end
#Calling the function
my_function(10, 5)
#Looking up the type of the function return
typeof(my_function(10, 5))
#This allows for each element to be given a variable
r, s = my_function(10, 5)
r
s

# IV Functions with keyword arguments

# * Keyword arguments are added after semi-colon
# * Their order is not explicit
# * Default values are addded

# 1 Creating a function with a keyword argument
function my_keyword_function(x, y; z = 3)
    return x + y + z
end

# * Omission of keyword argument uses default
my_keyword_function(1, 2)
# * Keyword argument names must be used
my_keyword_function(1, 2, z = 10)

# 4 Use of dot notation for functions

# * Passes a collection elementwise to a function
# * Use instead of map()
sin.([0., π/2., π, 3/2. * π, π])
