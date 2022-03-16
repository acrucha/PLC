import Prelude hiding (Maybe (..))

data Maybe a = Just a |
               Nothing
               deriving(Show)

main = do
       a <- getLine
       safeCalc a

safeCalc :: String -> IO ()