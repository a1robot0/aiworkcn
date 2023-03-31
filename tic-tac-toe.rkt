#lang racket/gui

(define board-size 3)
(define cell-size 50)

;; 游戏状态
(define (make-game-state)
  (list 'noughts
        (make-vector (* board-size board-size) 'empty)))

(define (current-player state)
  (car state))

(define (board state)
  (cadr state))

(define (set-board! state new-board)
  (set-car! (cdr state) new-board))

(define (get-square row col state)
  (vector-ref (board state) (+ row (* col board-size))))

(define (set-square! row col val state)
  (vector-set! (board state) (+ row (* col board-size)) val))

(define (winner state)
  (let loop ((i 0))
    (cond
      [(= i board-size) #f]
      [(check-row i state) (get-square i 0 state)]
      [(check-column i state) (get-square 0 i state)]
      [(check-diagonal-1 state) (get-square 0 0 state)]
      [(check-diagonal-2 state) (get-square 0 (- board-size 1) state)]
      [else (loop (+ i 1))])))

(define (check-row row state)
  (let loop ((i 0) (last (get-square row 0 state)))
    (cond
      [(or (= i board-size) (not (eq? last (get-square row i state)))) #f]
      [(eq? last 'empty) #f]
      [else (loop (+ i 1) last)])))

(define (check-column col state)
  (let loop ((i 0) (last (get-square 0 col state)))
    (cond
      [(or (= i board-size) (not (eq? last (get-square i col state)))) #f]
      [(eq? last 'empty) #f]
      [else (loop (+ i 1) last)])))

(define (check-diagonal-1 state)
  (let loop ((i 0) (last (get-square 0 0 state)))
    (cond
      [(or (= i board-size) (not (eq? last (get-square i i state)))) #f]
      [(eq? last 'empty) #f]
      [else (loop (+ i 1) last)])))

(define (check-diagonal-2 state)
  (let loop ((i 0) (last (get-square 0 (- board-size 1) state)))
    (cond
      [(or (= i board-size) (not (eq? last (get-square i (- board-size i 1) state)))) #f]
      [(eq? last 'empty) #f]
      [else (loop (+ i 1) last)])))

(define (game-over? state)
  (or (winner state) (board-full? state)))

(define (board-full? state)
  (let loop ((i 0))
    (cond
      [(= i (* board-size board-size)) #t]
      [(eq? (get-square (quotient i board-size) (remainder i board-size) state) 'empty) #f]
      [else (loop (+ i 1))])))

(define (next-player player)
  (if (eq? player 'noughts) 'crosses 'noughts))

;; GUI部分

(define frame (new frame% [label "Tic Tac Toe"] [width (* board-size cell-size)] [height (* board-size cell-size)]))
(define canvas (new canvas% [parent frame] [width (* board-size cell-size)] [height (* board-size cell-size)]))

(define (draw-board)
  (send canvas clear)
  (let loop ((row 0) (col 0))
    (cond
      [(= col board-size) (loop (+ row 1) 0)]
      [(= row board-size) #t]
      [else
       (let* ((x (* col cell-size))
              (y (* row cell-size))
              (val (get-square row col game-state)))
         (send canvas set-pen "BLACK" 1 'solid)
         (send canvas draw-rectangle x y cell-size cell-size)
         (cond
           [(eq? val 'noughts)
            (send canvas set-pen "RED" 3 'solid)
            (send canvas draw-arc (+ x (/ cell-size 4)) (+ y (/ cell-size 4)) (- cell-size (/ cell-size 2)) (- cell-size (/ cell-size 2)) 0 320)]
           [(eq? val 'crosses)
            (send canvas set-pen "BLUE" 3 'solid)
            (send canvas draw-line x y (+ x cell-size) (+ y cell-size))
            (send canvas draw-line (+ x cell-size) y x (+ y cell-size))]))
       (loop row (+ col 1))])))

(define (handle-click event)
  (define x (quotient (send event get-x) cell-size))
  (define y (quotient (send event get-y) cell-size))
  (if (or (game-over? game-state) (not (eq? (get-square y x game-state) 'empty))) #f
      (begin
        (set-square! y x (current-player game-state))
        (set-board! game-state (board game-state))
        (when (winner game-state) (message-box "Game Over" (format "~a wins!" (winner game-state))))
        (when (board-full? game-state) (message-box "Game Over" "It's a draw!"))
        (set! game-state (list (next-player (current-player game-state)) (board game-state)))
        (draw-board))))

(define game-state (make-game-state))
(draw-board)

(send frame show #t)
(send canvas register-event-handler 'left-down handle-click)

; 这段代码创建了一个基本的井字棋GUI游戏，其中包含了一个游戏状态的定义和管理、一个函数用于检查胜者、一个函数用于检查游戏是否结束、以及一个图形用户界面部分，它包括一个帧和一个画布，在画布上绘制了井字棋盘和玩家的棋子。
; 当玩家单击空白格时，会在其上放置当前玩家的棋子，并检查游戏是否结束。如果游戏结束，则弹出消息框显示获胜玩家或平局。
