(declare-const x Real)
(declare-const y Real)
(assert (xor (>= x 10) (>= y -10)))
(check-sat)
(exit)