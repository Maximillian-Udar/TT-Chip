# Overall idea
3 bit adder/multiplier



# Specifications
## __*Inputs:*__ 
    
[0:3]- First number (3 bit number)

[4:5]- Second number (3 bit number)

[6]- High/low -> Addition/multiplication

[7]- Binary/seven-segment display of result



## __*Outputs:*__ 

[0:7]- binary output (8 bit number)

__*OR*__

Seven-segment display: One digit at a time. 



### Can be toggled with input [7]

## __*Other:*__ 

Add one to every number: adding zero is a pointless exercise

# Number formatting

Given input
$$S_0S_1S_2S_3S_4S_5$$
Where $$[S_0S_1S_2]$$
Is the first number, and 

Where $$[S_3S_4S_5]$$
Is the second number

With $$S_0 | S_3$$
Are the most significant bit


# Logic
Adder logic
$$f(a, b, c)=$$