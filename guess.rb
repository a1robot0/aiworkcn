# This is a number guessing game in Ruby
# The program generates a random number between 1 and 100
# The user has to guess the number in as few attempts as possible

# Generate a random number between 1 and 100
number = rand(1..100)

# Initialize the number of attempts
attempts = 0

# Prompt the user to guess the number
puts "猜一个数字，它在1到100之间："

# Loop until the user guesses the number
loop do
  # Get the user's guess
  guess = gets.chomp.to_i

  # Increment the number of attempts
  attempts += 1

  # Compare the user's guess with the number
  if guess == number
    puts "恭喜你，你猜对了！你用了#{attempts}次尝试。"
    break
  elsif guess < number
    puts "不好意思，你猜小了。再试一次："
  else
    puts "不好意思，你猜大了。再试一次："
  end
end
