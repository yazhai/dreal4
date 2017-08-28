(set-info :precision 0.01)
(set-logic QF_NRA)
(declare-fun t () Real)
(assert (>= t 0.0))
(assert (<= t 2.0))
(declare-fun x () Real)
(assert (>= x 0.0))
(assert (<= x 2.0))
(declare-fun y () Real)
(assert (>= y 0.0))
(assert (<= y 2.0))
(assert (and (and (not (< (+ (sin t) 0.05) x)) (not (< (+ x 0.05) (sin t))) (not (< (+ (cos t) 0.05) y)) (not (< (+ y 0.05) (cos t)))) (and (not (< (+ 1.3 0.05) (+ (^ x 2) (^ y 2)))) (not (< (+ (+ (^ x 2) (^ y 2)) 0.05) 1.3)))))
(check-sat)
(exit)
