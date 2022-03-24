import Prelude hiding (Maybe (..))

main = do
       a <- getLine
       safeCalc a
       
data Maybe a = Just a |
               Nothing
               deriving(Show)

cutString :: String -> String -> (Int, Int, String)
cutString n (a:b:c:as) | a >= 'a' && a <= 'z' = (read n :: Int, read as :: Int, [a,b,c])
                       | otherwise = cutString (n ++ [a]) str
       where str = (b:c:as)

checkCommand :: (Int, Int, String) -> String
checkCommand (a, b, "sum") = show (a + b)
checkCommand (a, b, "mul") = show (a * b)
checkCommand (a, b, "sub") | a < b = "(" ++ show (a - b) ++ ")"
                           | otherwise = show (a - b)
checkCommand (a, 0, "div") = "Nothing"
checkCommand (a, b, "div") = show (a `div` b)

safeCalc :: String -> IO ()
safeCalc str | calc /= "Nothing" = putStr $ "Just " ++ calc
             | otherwise = putStr $ calc
       where calc = checkCommand (cutString [] str)