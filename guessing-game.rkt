#lang racket

(define secret-number (random 100))

(display "请猜一个 0 到 100 之间的数字：")

(define (play-guessing-game)
  (define guess (read))
  (cond ((< guess secret-number) (display "你猜的数字太小了！"))
        ((> guess secret-number) (display "你猜的数字太大了！"))
        (else (display "恭喜你，猜对了！")))
  (if (= guess secret-number)
      #t
      (play-guessing-game)))

(play-guessing-game)
