(set-logic QF_NRA)
(declare-fun x () Real)
(assert (> x 0.0))
(assert (< x 2.0))
(check-sat)
(assert (> x 5.0))
(check-sat)
(exit)