-- This is a number guessing game in Lua
-- The computer will generate a random number between 1 and 100
-- The user will have to guess the number
-- The computer will give hints if the guess is too high or too low

-- Generate a random number between 1 and 100
math.randomseed(os.time())
local numberToGuess = math.random(1, 100)

-- Ask the user to guess the number
print("Guess a number between 1 and 100:")
local guess = tonumber(io.read())

-- Check if the guess is correct
while guess ~= numberToGuess do
  -- If the guess is too high, give a hint and ask again
  if guess > numberToGuess then
    print("Too high, try again:")
  -- If the guess is too low, give a hint and ask again
  else
    print("Too low, try again:")
  end
  guess = tonumber(io.read())
end

-- If the guess is correct, congratulate the user
print("Congratulations, you guessed the number!") 
