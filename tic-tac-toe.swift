// 定义一个二维数组作为井字棋棋盘
var board = [[String]](repeating: [String](repeating: " ", count: 3), count: 3)

// 定义一个变量来表示当前玩家
var currentPlayer = "X"

// 定义一个函数来打印棋盘
func printBoard() {
    for i in 0..<3 {
        for j in 0..<3 {
            print(board[i][j], terminator: "")
            if j != 2 {
                print("|", terminator: "")
            }
        }
        print("")
        if i != 2 {
            print("-----")
        }
    }
}

// 定义一个函数来检查是否有玩家获胜
func checkForWin() -> Bool {
    // 检查每一行
    for i in 0..<3 {
        if board[i][0] != " " && board[i][0] == board[i][1] && board[i][1] == board[i][2] {
            return true
        }
    }
    
    // 检查每一列
    for i in 0..<3 {
        if board[0][i] != " " && board[0][i] == board[1][i] && board[1][i] == board[2][i] {
            return true
        }
    }
    
    // 检查对角线
    if board[0][0] != " " && board[0][0] == board[1][1] && board[1][1] == board[2][2] {
        return true
    }
    if board[0][2] != " " && board[0][2] == board[1][1] && board[1][1] == board[2][0] {
        return true
    }
    
    // 如果没有玩家获胜，则返回 false
    return false
}

// 定义一个变量来表示游戏是否结束
var gameOver = false

// 开始游戏循环
while !gameOver {
    // 打印当前棋盘
    printBoard()
    
    // 提示当前玩家落子
