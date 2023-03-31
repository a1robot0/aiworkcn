;; Define a function that generates a random number between 1 and 100
(defn generate-random-number []
  (rand-int 100))

;; Define a function that prompts the user to guess a number and returns their guess
(defn get-user-guess []
  (println "Guess a number between 1 and 100:")
  (read-line))

;; Define a function that compares the user's guess to the actual number and returns a message
(defn compare-guess [guess actual]
  (cond
    (< guess actual) "Too low!"
    (> guess actual) "Too high!"
    :else "You got it!"))

;; Define a function that runs the game
(defn play-game []
  (let [actual-number (generate-random-number)]
    (loop []
      (let [guess (Integer/parseInt (get-user-guess))]
        (println (compare-guess guess actual-number))
        (if (= guess actual-number)
          (println "You win!")
          (recur))))))

;; Call the play-game function to start the game
(play-game)
