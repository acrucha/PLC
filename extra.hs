-- ! Ordenação

greaterThan :: Ord t => t -> [t] -> [t]
greaterThan x [] = []
greaterThan x (a:as) | a > x     = [a] ++ (greaterThan x as)
                     | otherwise = greaterThan x as

lessThan :: Ord t => t -> [t] -> [t]
lessThan x [] = []
lessThan x (a:as) | a <= x    = [a] ++ (lessThan x as)
                  | otherwise = lessThan x as

quicksort :: Ord t => [t] -> [t]
quicksort [] = []
quicksort (a:as) = quicksort (lessThan a as) ++ [a] ++ quicksort (greaterThan a as)