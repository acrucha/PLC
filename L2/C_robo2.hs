main = do
       a <- getLine
       b <- getLine
       let result = faces (read a) (read b)
       print result

data Command = Forward Int | Backward Int | TurnLeft | TurnRight 
               deriving (Eq, Show, Read)

data Direction = North | South | West | East
                 deriving (Read, Show)


faces :: Direction -> [Command] -> Direction
faces x [] = x
faces North ((Forward v):as) = faces North as
faces North ((Backward v):as) = faces North as
faces North ((TurnLeft):as) = faces West as
faces North ((TurnRight):as) = faces East as
faces South ((Forward v):as) = faces South as
faces South ((Backward v):as) = faces South as
faces South ((TurnLeft):as) = faces East as
faces South ((TurnRight):as) = faces West as
faces East ((Forward v):as) = faces East as
faces East ((Backward v):as) = faces East as
faces East ((TurnLeft):as) = faces North as
faces East ((TurnRight):as) = faces South as
faces West ((Forward v):as) = faces West as
faces West ((Backward v):as) = faces West as
faces West ((TurnLeft):as) = faces South as
faces West ((TurnRight):as) = faces North as