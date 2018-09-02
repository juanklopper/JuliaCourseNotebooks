# WORKING WITH DATA
# -----------------

# I Distributions

# * Data point values for a distribution usually follow a pattern
# * Such patterns are called distributions
# * Distributions are either discrete or continuous
# * The Distribution.jl package contains most of the common
#       data distributions

# 1 Importing Distributions.jl
using Distributions
using Random


# 2 The standard normal distribution
#Seed the pseudo-random number generator
Random.seed!(1234)
#Saving the standard normal distribution as an object
n = Normal()
#Parameter values of the standard normal distribution
params(n)
#Select 10 elements at random from n
var1 = rand(n, 10)
#Calculating the mean and standard deviation of var1
mean(var1)
std(var1)
#Probability density function value at x = 0.3
pdf(Normal(), 0.3)
#Cumulative distribution function as x = 0.25
cdf(Normal(), 0.25)
#Quantiles
quantile(Normal(), 0.025)
quantile(Normal(), 0.975)

# 3 The normal distribution
#Returning the parameters of the normal distribution
fieldnames(Normal)
#Creating 100 data point values from a normal distribution
#  with a mean of 100 and a standard deviation of 10
var2 = rand(Normal(100, 10), 100)
#Calculating the mean and standard deviation of var2
mean(var2)
std(var2)
#Using fit() to calculate the parameters of a distribution
fit(Normal, var2)

# 3 Skewness and kurtosis
skewness(var2)
kurtosis(var2)

# 4 Beta distribution
b = Beta(1, 1)
params(b)
var3 = rand(b, 100)
fit(Beta, var3)

# 5 χ2 distribution
c = Chisq(1)
var4 = rand(c, 100)
fieldnames(Chisq) # Degrees of freedom

# 6 Distribution types are hierarchical
supertype(Normal)
subtypes(Distribution{Univariate,Continuous})
subtypes(Distribution{Univariate,Discrete})
# * Search for help in the REPL

# II DataFrames

using DataFrames

# * Allows for creation of a flat data structure (rows and columns)
# * Columns are variables
# * Rows are subjects (examples)

# 1 Create a DataFrame
typeof(var2)
#Create and empty DataFrame
df = DataFrame()

# 2 Add a column with data point values (rows)
df[:Var2] = var2
#View first five rows
head(df)

# 3 Add another columns
df[:Var3] = var3
#View last three rows
tail(df, 3)

# 4 Dimensions of a DataFrame
size(df)
rows = size(df, 1)
columns = size(df, 2)

# 5 Inspect content
showcols(df)
#Data type only
eltypes(df)
#Descriptive statistics
describe(df)
#Print in console
print(describe(df))

# 6 Create a bigger DataFrame
df2 = DataFrame()
df2[:A] = 1:10
df2[:B] = ["I", "II", "II", "I", "II","I", "II", "II", "I", "II"]
df2[:C] = rand(Normal(), 10)
df2[:D] = rand(Chisq(1), 10)

# 7 Slicing
#First three rows
df2[1:3, :]
#All rows columns 1 and 3
df2[:, [1, 3]]
#Different notation
df2[:, [:A, :C]]

# III Importing data files

# 1 Set working directory in Atom settings under Julia tab
pwd()

# 2 Import CSV
using CSV

# 3 Import csv file (in same directory)
data1 = CSV.read("CCS.csv")

# 4 Explore the data
typeof(data1)
head(data1)
showcols(data1)
eltypes(data1)
describe(data1)

# 5 Combining DataFrames
#Creating DataFrames
subjects = DataFrame(Number = [100, 101, 102, 103], Stage = ["I", "III", "II", "I"])
treatment  = DataFrame(Number = [103, 102, 101, 100], Treatment = ["A", "B", "A", "B"])
subjects
treatment
#Joining
df3 = join(subjects, treatment, on = :Number);
df3
#Adding a longer list of subjects
subjects = DataFrame(Number = [100, 101, 102, 103, 104, 105], Stage = ["I", "III", "II", "I", "II", "II"])
#Inner join
 df4 = join(subjects, treatment, on = :Number, kind = :inner);
 df4
#Outer joing: empty fields filled with missing
df5  = join(subjects, treatment, on = :Number, kind = :outer);
df5

# 6 Grouping
#Creating a new DataFrame
df6 = DataFrame(Group = rand(["A", "B", "C"], 15), Variable1 = randn(15), Variable2 = rand(15));
df6
#Grouping using by()
by(df6, :Group, size)
#Count unique data point values in :Group column
by(df6, :Group, dfc -> DataFrame(Count = size(dfc, 1)))
#Aggregate for descriptive statistics
print(aggregate(df6, :Group, [mean, std]))
#Group
groupby(df6, :Group)
length(groupby(df6, :Group))
groupby(df6, :Group)[2]

# 7 Selection
df6[:Variable1] .> 0
sub(df6, df6[:Variable1] .> 0)

# 8 New DataFrame by selection
df6A = sub(df6, df6[:Group] .== "A");
df6A

# 9 Sorting
df6S = sort!(df6, cols = [:Group, :Variable1], rev = true);
df6S
df6S2 = sort!(df6, cols = [:Group, :Variable1, :Variable2], rev = (false, false, true));
df6S2

# 10 Unique rows
#Creating a DataFrame with an obvious duplicate row
df7 = DataFrame(A = [1, 2, 2, 3, 4, 5],  B = [11, 12, 12, 13, 14, 15], C = ["A", "B", "B", "C", "D", "E"]);
df7
#Only unique rows
unique(df7)
df7
#Permanant change
unique!(df7)
df7

# 11 Delete rows
#Permanently
deleterows!(df7, [1, 5])
df7
