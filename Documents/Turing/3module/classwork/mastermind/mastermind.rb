class Mastermind
	def initialize
		hello
	end

	def hello
		puts "Welcome to MASTERMIND"
		starting_prompt
	end

	def starting_prompt
		puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
		input = gets.chomp
		placer(input)
	end

	def placer(input)
		if input == "p"
			play
		elsif input == "i"
			instructions
		elsif input == "q"
			quit
		else
			starting_prompt
		end
	end

	def instructions
		puts "You type some stuff or something..."
		puts "Press Enter To Continue!!!"
		gets.chomp
		prompt
	end

	def quit
		70.times { puts "GOODBYE!"}
	end

	def play
		@sequence = generate_beginner

		puts "I have generated a beginner sequence with four elements made up of:"
		puts "(r)ed, (g)reen, (b)lue, and (y)ellow."
 		puts "Use (q)uit at any time to end the game."
		play_prompt

	end

	def play_prompt
		puts "What's your guess?"

		input = gets.chomp
		input = parse_input(input)

		if correct?(@sequence, input)
			puts "Congratulations! You guessed the sequence #{@sequence.join} in X guesses over  X time."
		else
			puts "nah breh"
		end
	end

	def cheat
		p "The sequence is: #{@sequence.join}"
		play_prompt
	end

	def generate_beginner
		poss_chars = ["r", "g", "b", "y"]
		sequence = []
		4.times { sequence << poss_chars.shuffle!.sample }
		return sequence 
	end

	def parse_input(input)
		input = input.downcase
		if input == "c"
			cheat
		elsif input == "q"
			quit
		else
			input.chars
		end
	end

	def correct?(sequence, input)
		input == sequence
	end


end

Mastermind.new