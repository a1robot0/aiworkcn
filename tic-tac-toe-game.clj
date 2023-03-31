(ns tic-tac-toe-game.core
  (:gen-class))

(defn print-board [board]
  (doseq [row board]
    (println row)))

(defn check-row [board row player]
  (= (set row) #{player}))

(defn check-col [board col player]
  (= (set (map #(nth % col) board)) #{player}))

(defn check-diagonal [board player]
  (let [diag-1 (map #(nth % %) board)
        diag-2 (map #(nth % (- (count board) 1 %)) (range (count board)))]
    (or (= (set diag-1) #{player})
        (= (set diag-2) #{player}))))

(defn check-win [board player]
  (or (some #(check-row board % player) (range (count board)))
      (some #(check-col board % player) (range (count board)))
      (check-diagonal board player)))

(defn get-move [player]
  (println (str "Player " player ", enter your move."))
  (let [row (read-line "Row: ")
        col (read-line "Column: ")]
    [(- (Integer/parseInt row) 1) (- (Integer/parseInt col) 1)]))

(defn update-board [board move player]
  (assoc-in board move player))

(defn play-turn [board player]
  (let [move (get-move player)
        updated-board (update-board board move player)]
    (if (check-win updated-board player)
      (do (println (str "Player " player " wins!"))
          (print-board updated-board)
          true)
      (do (print-board updated-board)
          false))))

(defn play-game []
  (let [board (vec (repeat 3 (vec (repeat 3 nil))))
        players [:x :o]
        turns (cycle players)]
    (loop [board board
           turns turns]
      (if-let [winner (play-turn board (first turns))]
        winner
        (recur board (rest turns))))))

(play-game) ; Start the game
