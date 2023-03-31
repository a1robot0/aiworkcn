import Foundation

// 生成一个1到100之间的随机数
let answer = Int.random(in: 1...100)

// 初始化猜测次数为0
var guessCount = 0

// 循环进行猜测
while true {
    // 获取用户输入的数字
    print("请输入一个1到100之间的数字：")
    let input = readLine()
    
    // 将用户输入的字符串转换为整数
    guard let guess = Int(input ?? "") else {
        print("输入无效，请输入一个1到100之间的数字。")
        continue
    }
    
    // 猜测次数加1
    guessCount += 1
    
    // 判断猜测的数字是否等于答案
    if guess == answer {
        print("恭喜你，猜对了！你一共猜了\(guessCount)次。")
        break
    } else if guess < answer {
        print("猜错了，你猜的数字太小了。")
    } else {
        print("猜错了，你猜的数字太大了。")
    }
}
