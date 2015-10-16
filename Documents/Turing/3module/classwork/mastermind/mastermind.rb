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
		starting_prompt
	end

	def quit
		70000.times { print "GOODBYE!"}
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
		puts "'#{input.upcase}' has #{number_correct(input)} of the correct elements with #{position_correct(input)} in the correct positions"
		
		if @guess_counter == 1
			puts "You've taken #{@guess_counter} guess"
		else
			puts "You've taken #{@guess_counter} guesses"
		end
		# require 'pry' ; binding.pry
		play_prompt
	end

	def number_correct(input)
		number = 0 
		input = parse_input(input)
		@sequence.each do |char|
			if input.any? { |ic| ic == char }
				number += 1
			end
		end
		return number
	end

	def position_correct(input)
		input = parse_input(input)
		correct = @sequence.select.with_index do |seq_char, index|
			seq_char == input[index]
		end
		correct.count
	end

	def cheat
		p "The sequence is: #{@sequence.join}"
		play_prompt
	end

	def end_game
		@guess_counter += 1
		@fin_time = Time.now
		puts "Congratulations! You guessed the sequence #{@sequence.join} in #{@guess_counter} guesses over  #{calc_time(@fin_time, @start_time)}"
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

	def calc_time(fin_time, start_time)
		subt_time = fin_time - start_time

		if subt_time < 60.00
			return "#{subt_time.to_s.split(".").first} seconds."
		else
		split_min = (subt_time / 60).to_s.split(".").first
		split_sec = (subt_time % 60).to_s.split(".").first
		return "#{split_min} minutes and #{} seconds."
		end
	end

end

Mastermind.new