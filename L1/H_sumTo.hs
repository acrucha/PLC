-- DIKASTIS -- Some até...

main :: IO()
main = interact $ show . sumTo . read

sumList :: [Int] -> Int
sumList [] = 0
sumList (i:list) = i + sumList list

sumTo :: Int -> Int
sumTo n = sumList [1..n]