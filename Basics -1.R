# Arithmetic Operators

10 + 5   # add
10 - 5   # subtract
10 * 5   # multiply

10 / 5   # divide
10 ^ 3   # exponent

 # R also follows BODMAS rule
2 + 3 * 5 ^ 2

((2 + 3) * 5) ^ 2

 # modulus operator - returns remainder
100 %% 75

# Some in-built maths functions in R

log(2.7182)   # natural logarithm
exp(2)        # exponential function
sqrt(441)     # square root
abs(-10)      # returns absolute value
pi            # returns the constant value of pi

 # Rounding Numbers

round(233.234)              # rounds the value to the nearest whole number
round(233.234, digits = 1)  # rounds to the nearest tenth
round(233.234, digits = -2) # rounds to the hundreds place in the left direction

floor(2.8)   # always rounds down
ceiling(2.2) # always rounds up
trunc(2.6); trunc(-2.6)  # rounds in the direction of zero



# 5 Atomic Data Types

 # 1.double - Decimal numbers (Real numbers) in R. Every real number in R is stored as double
typeof(1)
typeof(-10.5)
 #Doubles can also take on the special values of Inf and -Inf, indicating infinity and -infinity.
typeof(Inf)   
typeof(-Inf)

 
# R has a special numeric value "NaN" that indicates numeric values that are "not a number." 
 # NaN values can arise when performing calculations that cannot be computed.
0/0
typeof(NaN)

 # 2.integer - datatype that only take whole numbered values.
as.integer(1)          # converts the double 1 to integer 1
typeof(as.integer(1))
as.integer(1.6)        # converting double to integer drops the decimal part

 # You can convert an integer to a double using the as.numeric() function
typeof(as.numeric(as.integer(1))) 

 # R knows that doubles and integers are both numeric data types so it will convert them as necessary to perform mathematical operations
10.1 + as.integer(20)

 # 3. complex - Numbers with both real and imaginary component
typeof(2+3i)
typeof(3i)

 # If you try to take the square root of a negative real number, the result is NaN
sqrt(-1)
sqrt(-1+0i)  #You can however, take the square root of the complex version of -1

as.complex(10)     # convert double to complex
as.numeric(10+1i)  # convert complex to double

 # 4. logical - A Logical takes on the value of TRUE or FALSE.  Data that only takes on the values of True or False are also called "Booleans".
typeof(TRUE)
typeof(FALSE)

20 > 20
20 >= 20

 # to check equality 
10 == 10
TRUE == FALSE

 # to check inequality
"cat" != "dog"
TRUE != FALSE

!FALSE    # Negation

 # For logical AND, use "&" and for logical or, use "|".
(2 > 1) & (8 > 9)
(2 > 1) | (8 > 9)

 #Similar to math expressions, logical operations have a fixed order of operations. In a logical statement, ! is executed first, followed by & and finally |. Equality and inequality are executed last and parentheses can be used to enforce the desired order of operations.
 # All numeric values convert to TRUE except for zero.
as.logical(1)
as.logical(0)
as.logical(-1)

as.numeric(TRUE)   # convert logical values to numeric
as.numeric(FALSE)

 #Since zero converts to FALSE and 1 converts to TRUE, columns of data that consist of only zeros and ones, sometimes known as indicator variables or dummy variables, can be thought of as equivalent to columns of TRUE and FALSE values in R.

 # 5. Character - quoted text
typeof("cat")
typeof("1")

as.numeric("1")         # convert character to numeric
typeof(as.numeric("1"))

