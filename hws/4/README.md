# Homework 4
The written portion is available [here](https://docs.google.com/document/d/1XybXmTD5-NTJ1gfLq3tYb-wUUDJGZS8xgO912DLf50Q/edit?usp=sharing)

The mux module was conceptually easy to write. I turned a regular 2:1 mux into its own module, then continued to increase in size 1 power of 2 at a time. In comparison to writing a size n mux, it wasn’t complicated but it did require me to write out code over and over again which felt tedious. I ended up having an issue where I wasn’t getting the values I anticipated out, and had to swap the locations of in0 and in1 at the lowest level mux. Being able to fix all expanded versions by the alteration in the low level mux was a good example of how modular code is a good idea. For the adder I couldn’t bring myself to write out that many lines again, so after writing the full adder which I had already made for the lab, I used a for loop to add more adders together in line for a ripple carry adder. I made an n_adder, but set the default size to 32 bits.
In order to test the mux, I mapped all the inputs to a bus that could be more easily manipulated than 32 distinct values. I then assigned the 32 input bits to a random 32 bit integer value, and checked that every bit through my mux matched the expected output gotten by pulling the specific bits from the random number.
To test the 32 bit adder, run:
make test_adder_32
To test the 32 bit mux, run:
make test_mux

Add a pdf of your written answers to this folder, then use `make clean` then `make submission` to submit!