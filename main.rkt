#lang racket/gui

; Define the main frame
(define frame (new frame% 
                   [label "加减法计算器"]
                   [width 300]
                   [height 200]))

; Define the horizontal box container
(define hbox (new horizontal-pane% 
                  [parent frame]
                  [alignment '(center center)]))

; Define the vertical box container for the addition operation
(define vbox-add (new vertical-pane% 
                      [parent hbox]
                      [alignment '(center center)]))

; Define the vertical box container for the subtraction operation
(define vbox-sub (new vertical-pane% 
                      [parent hbox]
                      [alignment '(center center)]))

; Define the addition operation label and input field
(define add-label (new message% 
                      [parent vbox-add]
                      [label "加法:"]))
(define add-field (new text-field% 
                      [parent vbox-add]
                      [label "加数:"]
                      [init-value "0"]))

; Define the subtraction operation label and input field
(define sub-label (new message% 
                      [parent vbox-sub]
                      [label "减法:"]))
(define sub-field (new text-field% 
                      [parent vbox-sub]
                      [label "被减数:"]
                      [init-value "0"]))

; Define the button to perform the addition and subtraction operations
(define button (new button% 
                   [parent frame]
                   [label "计算"]
                   [callback (lambda (button event)
                               (message-box "结果" 
                                            (string-append "加法结果: " 
                                                           (number->string (+ (string->number (send add-field get-value)) 
                                                                             (string->number (send sub-field get-value)))) 
                                                           "\n" 
                                                           "减法结果: " 
                                                           (number->string (- (string->number (send sub-field get-value)) 
                                                                             (string->number (send add-field get-value)))))))]))

; Show the frame
(send frame show #t)
