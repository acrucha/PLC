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

slice :: String -> Int -> Int -> String -> (Int, String)
slice "Delete" cur n str = (cur, take cur str ++ drop (cur+n) str)
slice "Backspace" cur n str | dif < 0 = (0, take n str)
                            | otherwise = (dif, take dif str ++ drop cur str)
       where dif = cur - n

add :: String -> Int -> String -> (Int, String)
add s cur str = (cur, take cur str ++ s ++ drop cur str)

runCommand :: (Int, [Cmd]) -> String -> (Int, [Cmd], String)
runCommand (cur, []) str = (cur, [], str)

runCommand (cur, (Cursor n:as)) str | cur+n >= 0 = runCommand (cur+n, as) str
                                    | otherwise = runCommand (0, as) str

runCommand (cur, (Backspace n:as)) str = runCommand (fst sliceBack, as) (snd sliceBack)
       where sliceBack = slice "Backspace" cur n str

runCommand (cur, (Delete n:as)) str = runCommand (fst sliceFront, as) (snd sliceFront)
       where sliceFront = slice "Delete" cur n str

runCommand (cur, (Insert s:as)) str = runCommand (fst addString, as) (snd addString)
       where addString = add s cur str


editText :: String -> [Cmd] -> String
editText str [] = str
editText str cmds = result
       where (f, s, result) = runCommand (0, cmds) str