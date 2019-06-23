(defn ave
  [numbers]
  (/ (apply + numbers) (count numbers)))

(println (ave [1 2 3 4]))

(println (ave '(1 2 3 4)))
