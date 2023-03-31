(ns tic-tac-toe.core
  (:gen-class))

(def board (ref (vec (repeat 9 \space))))
(def player (ref "X"))

(defn print-board []
  (doseq [row (partition 3 @board)]
    (println (apply str row))))

(defn winner [board]
  (let [winning-positions [[0 1 2] [3 4 5] [6 7 8]
                           [0 3 6] [1 4 7] [2 5 8]
                           [0 4 8] [2 4 6]]
        check-position (fn [position]
                         (let [pieces (map #(get board %) position)]
                           (if (= (set pieces) #{\X}) "X"
                             (if (= (set pieces) #{\O}) "O"
                               nil))))]
    (->> winning-positions
         (map check-position)
         (remove nil?)
         first)))

(defn valid-move? [position]
  (= (\space) (get @board position)))

(defn make-move [position]
  (dosync
    (let [current-player @player]
      (alter board assoc position current-player)
      (ref-set player (if (= current-player "X") "O" "X")))))

(defn game-over? []
  (or (not-any? #(= (\space) %) @board) (not (nil? (winner @board)))))

(defn -main []
  (while (not (game-over?))
    (println "Player " @player "'s turn")
    (print-board)
    (println "Enter a position (0-8): ")
    (let [position (read-line)]
      (if (and (number? (read-string position)) (valid-move? (read-string position)))
        (make-move (read-string position))
        (println "Invalid move. Try again."))))
  (print-board)
  (let [w (winner @board)]
    (if w
      (println "Player " w " wins!")
      (println "It's a tie!"))))

(-main)
