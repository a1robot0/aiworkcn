// Define a 3x3 game board as a nested array
var gameBoard = [[String]](repeating: [String](repeating: "-", count: 3), count: 3)

// Define a function to print the game board
func printGameBoard() {
    for row in gameBoard {
        print(row.joined(separator: " "))
    }
}

// Define a function to check if a player has won
func checkWin(player: String) -> Bool {
    // Check rows
    for row in gameBoard {
        if row == [player, player, player] {
            return true
        }
    }
    // Check columns
    for i in 0..<3 {
        if gameBoard[0][i] == player && gameBoard[1][i] == player && gameBoard[2][i] == player {
            return true
        }
    }
    // Check diagonals
    if gameBoard[0][0] == player && gameBoard[1][1] == player && gameBoard[2][2] == player {
        return true
    }
    if gameBoard[0][2] == player && gameBoard[1][1] == player && gameBoard[2][0] == player {
        return true
    }
    // No win condition met
    return false
}

// Define a variable to keep track of the current player
var currentPlayer = "X"

// Define a loop to keep playing until someone wins or the board is full
while true {
    // Print the game board
    printGameBoard()
    // Ask the current player to make a move
    print("Player \(currentPlayer), make your move (row column):")
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let row = input[0]
    let col = input[1]
    // Check if the move is valid
    if gameBoard[row][col] != "-" {
        print("Invalid move, try again.")
        continue
    }
    // Update the game board with the move
    gameBoard[row][col] = currentPlayer
    // Check if the current player has won
    if checkWin(player: currentPlayer) {
        printGameBoard()
        print("Player \(currentPlayer) wins!")
        break
    }
    // Check if the game is a tie
    if !gameBoard.joined().contains("-") {
        printGameBoard()
        print("Game ends in a tie!")
        break
    }
    // Switch to the other player
    currentPlayer = currentPlayer == "X" ? "O" : "X"
}
