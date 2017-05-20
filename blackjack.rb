


#=================================== v METHODS v =====================================#

# Slows down text by 1/20 of a second
def slowText(statement)
	statement.each_char { |letter|
		sleep 0.050
		print letter
	}
	puts
end


# Shows you the index of each deck array object starting at 1
def cardIndexes
	@counter = 0
	@deck.each do |card|
		@counter += 1
		puts @counter.to_s + " - " + card.to_s
	end
end


# Display commands
def blackJackCommands
	@understand = false
	commands = %(
	 -----------------------------
|  -------------------------- |
| | To Hit: Type in  "Hit"  | |
| | To Stay: Type in "Stay" | |
| | For Cmds: Type in "Cmd" | |
| |To See cards: Type "Show"| |
|  -------------------------- |
-----------------------------
	)
puts commands
puts

	while @understand == false
		print "Please type in \"Quit\" to quit help: "
		userInput = gets.chomp
		puts
		@understand = true if userInput.capitalize == "Quit"
	end

end


def showUserCards # Displays user cards
	lengthOfUserPoints = "You:#{@userPoints}".length
	puts "Your cards:"
	puts " ------------------------ "
	puts "|" + "You:#{@userPoints}".rjust(15) + "|".rjust(16 - lengthOfUserPoints)
	puts " ------------------------ "
	@userCards.each do |card|
		lengthOfCardName = "#{card[0]} of #{card[1]}".length
		puts "|" + "#{card[0]} of #{card[1]}" + "|".rjust(25 - lengthOfCardName)
	end
	puts " ------------------------ "
	puts
end


def showCPUOpponentCards # Displays computer's cards
	lengthOfCPUPoints = "CPU: #{@cpuOpponentPoints}".length
	puts "Computer's cards:"
	puts " ------------------------ "
	puts "|" + "CPU:#{@cpuOpponentPoints}".rjust(15) + "|".rjust(17 - lengthOfCPUPoints)
	puts " ------------------------ "
	@cpuOpponentCards.each do |card|
		lengthOfCardName = "#{card[0]} of #{card[1]}".length
		puts "|" + "#{card[0]} of #{card[1]}" + "|".rjust(25 - lengthOfCardName)
	end
	puts " ------------------------ "
	puts
end

#=================================== ^ METHODS ^ =====================================#

# Deck elements, cardType, cardSuit,
cardLabel = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
cardSuit = ["Hearts", "Spades", "Clubs", "Diamonds"]
@deck = []

# Makes deck using deck elements
cardLabel.each do |label|
	cardSuit.each do |suit|
		@deck.push([label, suit])
	end
end


# Gives all aces two values of 1 or 11
@deck[48..51].each do |ace|
	ace.push(1).push(11)
end

# Gives all twos a value of 2
@deck[0..3].each do |two|
	two.push(2)
end

# Gives all threes a value of 3
@deck[4..7].each do |three|
	three.push(3)
end

# Gives all fours a value of 4
@deck[8..11].each do |four|
	four.push(4)
end

# Gives all fives a value of 5
@deck[12..15].each do |five|
	five.push(5)
end

# Gives all sixs a value of 6
@deck[16..19].each do |six|
	six.push(6)
end

# Gives all sevens a value of 7
@deck[20..23].each do |seven|
	seven.push(7)
end

# Gives all eights a value of 8
@deck[24..27].each do |eight|
	eight.push(8)
end

# Gives all nines a value of 9
@deck[28..31].each do |nine|
	nine.push(9)
end

# Gives all face cards (J,Q,K) values of 10
@deck[32..47].each do |faceCard|
	faceCard.push(10)
end

# Greeting text
welcomeBlackJack = %(

	 -------------------
	| B l a c k j a c k |
	 -------------------
)

slowText(welcomeBlackJack)

# Asks user if they would like to play a game of Blackjack
slowText("Welcome to Blackjack, would you like to play?")
print "Please enter Yes or No: "
userInput = gets.chomp

if (userInput != "Yes") && userInput != "No"
	until (userInput.capitalize == "Yes") || userInput.capitalize == "No"
		puts
		puts "Error: Unknown Command"
		print "Please enter in \"Yes\" or \"No\": "
		userInput = gets.chomp
	end
end

case userInput
when  "Yes"
	puts
	slowText("Progress 50%")
	puts
when "No"
	puts
	slowText("Have a good one!")
	puts
	abort
end


# Asks user if they're familiar with all commands available during game
slowText("Do you know all of the commands to play Blackjack?")
print "Please enter Yes or No: "
userInput = gets.chomp

while userInput.capitalize != "Yes" && userInput.capitalize != "No"
	puts
	puts "Error: Unknown Command"
	print "Please enter \"Yes\" or \"No\": "
	userInput = gets.chomp
end

case userInput.capitalize
when "Yes"
	puts
	slowText("Progress 100%")
	puts
when "No"
	puts
	blackJackCommands
	slowText("Progress 100%")
	puts
end

puts "Have fun and good luck!"
slowText("Dealing cards.......")
puts "#{puts} #{puts}"



# Shuffles deck
@deck.shuffle!
@blackJack = %(
		  	    -----------
		  	   | Blackjack |
		  	    -----------
			  )

# Computer's points and an array(list) containing what cards it has
@cpuOpponentPoints = 0
@cpuOpponentCards = []

# User's points and an array(list) containing what cards it has
@userPoints = 0
@userCards = []


# Computer and User are both dealt their first two cards
2.times do
	dealtCard = @deck.first

	if dealtCard.size == 4
		if @cpuOpponentPoints + dealtCard[3] <= 21
			@cpuOpponentPoints += dealtCard[3]
			@cpuOpponentCards.push(dealtCard)
			@deck.shift
			next
		else @cpuOpponentPoints + dealtCard[2] <= 21
			@cpuOpponentPoints += dealtCard[2]
			@cpuOpponentCards.push(dealtCard)
			@deck.shift
			next
		end
	end

	@cpuOpponentPoints += dealtCard[2]
	@cpuOpponentCards.push(dealtCard)
	@deck.shift


	dealtCard = @deck.first

	if dealtCard.size == 4

		puts "You were dealt an #{dealtCard[0]} of #{dealtCard[1]}!"
		print "What value would you like to make it? Enter in 1 or 11: "
		userInput = gets.chomp
		puts "#{puts}"

		until userInput == "1" || userInput == "11"
			if userInput.capitalize == "Show"
				showUserCards
				print "Please enter 1 or 11: "
				userInput = gets.chomp
				puts
			elsif userInput.capitalize == "Cmd"
 				blackJackCommands
				print "Please enter 1 or 11: "
				userInput = gets.chomp
				puts
			else
				puts "Error: Unknown Command"
				print "Please enter 1 or 11: "
				userInput = gets.chomp
				puts
			end
		end

		if userInput == "1"
			puts
			dealtCard.delete(11)
		else
			puts
			dealtCard.delete(1)
		end
	else
		if dealtCard[0] == "8"
			puts "You were dealt an #{dealtCard[0]}!"
		else
			puts "You were dealt a #{dealtCard[0]}!"
		end
	end

	@userPoints += dealtCard[2]
	@userCards.push(dealtCard)
	@deck.shift

end

puts
puts "Your Points: #{@userPoints}"
puts "#{puts}"

if @cpuOpponentPoints == 21 && @userPoints == 21
	slowText(@blackJack)
	sleep 2.5
	puts "It's a tie. How rare is this!!"
	puts
	showCPUOpponentCards
	showUserCards
	abort
end

if @cpuOpponentPoints == 21 && @userPoints != 21
	slowText(@blackJack)
	sleep 2.5
	puts "You lose! Good Game."
	puts
	showCPUOpponentCards
	showUserCards
	abort
end

if @userPoints == 21 && @cpuOpponentPoints != 21
	slowText(@blackJack)
	sleep 2.5
	puts "You win! Congratulations!"
	puts
	showCPUOpponentCards
	showUserCards
	abort
end



# Computer and User are dealt a card once per iteration of the loops
loop do

	unless @cpuOpponentPoints >= 17 then
		1.times do
			if @cpuOpponentPoints == 21
				break
			elsif @cpuOpponentPoints >= 17
				break
			elsif @cpuOpponentPoints > 21
				break
			else
				nil
			end

			dealtCard = @deck.first

			if dealtCard.size == 4
				if @cpuOpponentPoints + dealtCard[3] > 21
					dealtCard.delete(11)
				else
					dealtCard.delete(1)
				end
			end

			@cpuOpponentPoints += dealtCard[2]
			@cpuOpponentCards.push(dealtCard)
			@deck.shift
		end
	end


	1.times do
		print "What would you like to do?: "
		userInput = gets.chomp
		@loopBreaker = userInput.capitalize
		puts

		until userInput.capitalize == "Hit" || userInput.capitalize == "Stay" || userInput.capitalize == "Show" || userInput.capitalize == "Cmd"
			puts "Error: Unknown Command"
			print "Please enter \"Hit\" or \"Stay\": "
			userInput = gets.chomp
			puts
		end

		case
		when userInput.capitalize == "Hit"

			dealtCard = @deck.first

			if dealtCard.size == 4
				puts
				puts "You were dealt an #{dealtCard[0]} of #{dealtCard[1]}!"
				print "What value would you like to make it? Enter in 1 or 11: "
				userInput = gets.chomp
				puts

				until userInput == "1" || userInput == "11"
					puts "Error: Unknown Command"
					print "Please enter \"1\" or \"11\": "
					@userInput = gets.chomp
					puts
				end

				if userInput == "1"
					puts
					dealtCard.delete(11)
				else
					puts
					dealtCard.delete(1)
				end
			else
				if dealtCard[0] == "8"
					puts
					puts "You were dealt an #{dealtCard[0]}!"
				else
					puts
					puts "You were dealt a #{dealtCard[0]}!"
				end
			end

			@userPoints += dealtCard[2]
			@userCards.push(dealtCard)
			puts
			puts "Your Points: #{@userPoints}"
			puts
			puts
			@deck.shift

		when userInput.capitalize == "Show"
			showUserCards
		when userInput.capitalize == "Cmd"
			blackJackCommands
		end
	end
	break if @loopBreaker == "Stay"
	break if @userPoints >= 21
end



# Compares User points and Computer points to determine winner
case
when @userPoints == 21 && @cpuOpponentPoints == 21
	slowText(@blackJack)
	sleep 2.5
	slowText("The result is......")
	puts "#{puts}"
	sleep 2.5
	puts "It's a tie. How rare is this!!"
	showCPUOpponentCards
	showUserCards
	abort
when @userPoints && @cpuOpponentPoints < 21 && @userPoints == @cpuOpponentPoints
	sleep 2.5
	slowText("The result is......")
	puts "#{puts}"
	sleep 2.5
	puts "It's a tie. How rare is this!!"
	showCPUOpponentCards
	showUserCards
	abort
when @userPoints == 21 && @cpuOpponentPoints != 21
	slowText(@blackJack)
	sleep 2.5
	slowText("The result is......")
	puts "#{puts}"
	sleep 2.5
	puts "Congratulations, You win!"
	showCPUOpponentCards
	showUserCards
	abort
when @userPoints != 21 && @cpuOpponentPoints == 21
	slowText(@blackJack)
	sleep 2.5
	slowText("The result is......")
	puts "#{puts}"
	sleep 2.5
	puts "You lose, Good Game!"
	showCPUOpponentCards
	showUserCards
	abort
when @userPoints > 21 && @cpuOpponentPoints > 21
	slowText("Bust!")
	sleep 2.5
	slowText("The result is......")
	puts "#{puts}"
	sleep 2.5
	puts "It's a draw."
	showCPUOpponentCards
	showUserCards
	abort
when @userPoints > 21 && @cpuOpponentPoints < 21 # USER BUST ಠ益ಠ
	sleep 2.5
	slowText("The result is......")
	puts "#{puts}"
	sleep 2.5
	puts "You lose, Good Game!"
	showCPUOpponentCards
	showUserCards
	abort
when @userPoints < 21 && @cpuOpponentPoints > 21 # CPU BUST! ಠ益ಠ
	slowText("Bust!")
	sleep 2.5
	slowText("The result is......")
	puts "#{puts}"
	sleep 2.5
	puts "Congratulations, You win!"
	showCPUOpponentCards
	showUserCards
	abort
when @userPoints < @cpuOpponentPoints && @userPoints < 21 && @cpuOpponentPoints < 21
	sleep 2.5
	slowText("The result is......")
	puts "#{puts}"
	sleep 2.5
	puts "You lose, Good Game!"
	showCPUOpponentCards
	showUserCards
	abort
when @userPoints > @cpuOpponentPoints && @userPoints < 21 && @cpuOpponentPoints < 21
	sleep 2.5
	slowText("The result is......")
	puts "#{puts}"
	sleep 2.5
	puts "Congratulations, You win!"
	showCPUOpponentCards
	showUserCards
	abort
end
