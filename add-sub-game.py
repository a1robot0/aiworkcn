import tkinter as tk
import random

class MathGame:
    def __init__(self, master):
        self.master = master
        master.title("add-sub-game")

        self.num1 = random.randint(1, 100)
        self.num2 = random.randint(1, 100)
        self.operator = random.choice(['+', '-'])

        self.question = tk.Label(master, text=f"What is {self.num1} {self.operator} {self.num2}?")
        self.question.pack()

        self.answer_entry = tk.Entry(master)
        self.answer_entry.pack()

        self.submit_button = tk.Button(master, text="Submit", command=self.check_answer)
        self.submit_button.pack()

        self.result = tk.Label(master, text="")
        self.result.pack()

    def check_answer(self):
        user_answer = self.answer_entry.get()
        try:
            user_answer = int(user_answer)
        except ValueError:
            self.result.config(text="Invalid input. Please enter an integer.")
        else:
            if self.operator == '+':
                correct_answer = self.num1 + self.num2
            else:
                correct_answer = self.num1 - self.num2

            if user_answer == correct_answer:
                self.result.config(text="Correct!")
            else:
                self.result.config(text=f"Incorrect. The correct answer is {correct_answer}.")

            self.num1 = random.randint(1, 100)
            self.num2 = random.randint(1, 100)
            self.operator = random.choice(['+', '-'])
            self.question.config(text=f"What is {self.num1} {self.operator} {self.num2}?")
            self.answer_entry.delete(0, tk.END)

root = tk.Tk()
game = MathGame(root)
root.mainloop()
