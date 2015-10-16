class Mastermind
	def initialize
		hello
	end

	def hello
		puts "Welcome to MASTERMIND"
		prompt
	end

	def prompt
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
			prompt
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
	end


end

Mastermind.new