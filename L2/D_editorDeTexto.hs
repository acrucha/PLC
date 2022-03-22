main = do
       a <- getLine
       b <- getLine
       let result = editText a (read b)
       print result

data Cmd = Cursor Int
         | Backspace Int
         | Delete Int
         | Insert String
         deriving (Read)

editText :: String -> [Cmd] -> String