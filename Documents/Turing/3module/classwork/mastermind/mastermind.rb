class Mastermind
	def initialize
		@start_time = nil
		@guess_counter = 0
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
		@start_time = Time.now
		@sequence = generate_beginner

		puts "I have generated a beginner sequence with four elements made up of:"
		puts "(r)ed, (g)reen, (b)lue, and (y)ellow."
 		puts "Use (q)uit at any time to end the game."
		play_prompt

	end

	def play_prompt
		puts "What's your guess?"

		input = gets.chomp
		if input == "c"
			cheat
		elsif input == "q"
			quit
		else
			if correct?(@sequence, input)
				end_game
			else
				incorrect(input)
			end
		end
	end

	def incorrect(input)
		@guess_counter += 1
		puts "'#{input.upcase}' has X of the correct elements with X in the correct positions"
		
		if @guess_counter == 1
			puts "You've taken #{@guess_counter} guess"
		else
			puts "You've taken #{@guess_counter} guesses"
		end
		# require 'pry' ; binding.pry
		play_prompt
	end

	def cheat
		p "The sequence is: #{@sequence.join}"
		play_prompt
	end

	def end_game
		@guess_counter += 1
		@fin_time = Time.now
		puts "Congratulations! You guessed the sequence #{@sequence.join} in #{@guess_counter} guesses over  #{@fin_time - @start_time} seconds."
	end

	def generate_beginner
		poss_chars = ["r", "g", "b", "y"]
		sequence = []
		4.times { sequence << poss_chars.shuffle!.sample }
		return sequence 
	end

	def parse_input(input)
		input = input.downcase.chars
	end

	def correct?(sequence, input)
		parse_input(input) == sequence
	end


end

Mastermind.new