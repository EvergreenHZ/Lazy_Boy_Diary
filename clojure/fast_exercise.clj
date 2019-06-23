(str "Hello " "World!")
(vector 1 2 3 4)
(list 1 2 3 4)
(hash-map :a 1 :b 2)
(hash-set 1 2 3 1)

(defn add-100
  [x]
  (+ x 100))

(defn dec-maker
  [n]
  (fn
    [x]
    (- x n)))

(defn new-dec-maker
  [n]
  #(- % n))

(defn mapset
  [f coll]
  (let [result #{}]
    (cond ((empty? coll) result)
          (do (into result (f (first coll)))
              (mapset f (rest coll))))))

(defn sum #(reduce + %))
(defn avg #(/ (sum %) (count %)))
(defn stats
  [nums]
  (map #(% nums) [sum count acg]))

(reduce (fn [new-map [key val]]
          (assoc new-map key (inc val)))
        {}
        {:max 39 :min 10})
;; map is treated as a list of vectors

(defn even?
  [x]
  (cond ((= x 0) true)
        (odd? (- x 1))))
(defn odd?
  [x]
  (cond ((= x 0) false)
        (even? (- x 1))))

(defn create-new-map
  [coll]
  (reduce (fn [new-map [key val]])
          (if (> val 4)
            (assoc new-map key val)
            new-map)
          {}
          coll))

(defn collect-all-evens
  [coll]
  (reduce (fn [new-coll first-elem]
            (if (even? first-elem)
              (cons new-coll first-elem)
              new-coll))
          '()
          coll))

;; how to construct same coll

(take 2 [1 2 3 4 5 6])
(drop 2 [1 2 3 4 5 6])
(drop-while #(< % 3) [1 2 3 4 5])
(take-while #(< % 3) [1 2 3 4 5])

(filter #(< % 10) [1 2 11 21 3 15])
(some #(< % 10) [1 2 3 4])

(sort [2 4 1 9])
(concat [1 2] [3 4])

(concat (take 8 (repeat "na")) ["BatMan!"])
(take 2 (repeatedly (fn [] (rand-int 10))))

(defn even-nums
  ([] (even-nums 0))
  ([n] (cons n
             (even-nums (+ n 2)))))

;; Sequence Abstraction: operation on members individually
;; Collection Abstraction: the whole data structure
(empty? [])
(count '(1 2 3 4))

(max 1 2 3) ;; 3
(max [1 2 3]) ;; [1 2 3]
(reducd max [1 2 3 4]) ;; 4
(apply max [1 2 3 4]) ;; 4

(require '[clojure.string :as s])

(def add-10
  (partial + 10))

(defn add-n
  [n]
  (partial + n))

((comp inc *) 2 3)

(defmacro and
  {:added "1.0"}
  ([] true)
  ([x] x)
  ([x & next]
   `(let [and# ~x]
      (if and# (and ~@next) and#))))
