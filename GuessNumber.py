import random

# 生成一个随机数
number = random.randint(1, 100)

# 提示用户猜数字
guess = int(input("猜一个1到100之间的数字："))

# 判断用户猜的数字是否正确
while guess != number:
    if guess < number:
        print("猜小了！")
    else:
        print("猜大了！")
    guess = int(input("再猜一次："))

# 猜对了
print("恭喜你，猜对了！")
