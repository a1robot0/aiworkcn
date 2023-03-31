import random

# 随机选择一个1-100之间的数字
number = random.randint(1, 100)

print("我想了一个1-100之间的数字，请猜猜是多少？")

while True:
    # 获取玩家的输入
    guess = int(input())

    # 判断玩家猜测的数字与答案的大小关系
    if guess == number:
        print("恭喜你，猜对了！")
        break
    elif guess < number:
        print("猜小了，请再试一次。")
    else:
        print("猜大了，请再试一次。")
