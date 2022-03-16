main = do
       a <- getLine
       b <- getLine
       let result = destination (read a) (read b)
       print result

data Command = Forward Int | Backward Int | TurnLeft | TurnRight 
               deriving (Eq, Show, Read)

data Direction = North | South | West | East
                 deriving (Read, Show)

destination :: (Int,Int) -> [Command] -> (Int,Int) 
destination (x,y) command = faces North (x,y) command 

faces :: Direction -> (Int,Int) -> [Command] -> (Int,Int)
faces n (x,y) [] = (x,y)
faces North (x,y) ((Forward v):as) = faces North (x,y+v) as
faces North (x,y) ((Backward v):as) = faces North (x,y-v) as
faces North (x,y) ((TurnLeft):as) = faces West (x,y) as
faces North (x,y) ((TurnRight):as) = faces East (x,y) as
faces South (x,y) ((Forward v):as) = faces South (x,y-v) as
faces South (x,y) ((Backward v):as) = faces South (x,y+v) as
faces South (x,y) ((TurnLeft):as) = faces East (x,y) as
faces South (x,y) ((TurnRight):as) = faces West (x,y) as
faces East (x,y) ((Forward v):as) = faces East (x+v,y) as
faces East (x,y) ((Backward v):as) = faces East (x-v,y) as
faces East (x,y) ((TurnLeft):as) = faces North (x,y) as
faces East (x,y) ((TurnRight):as) = faces South (x,y) as
faces West (x,y) ((Forward v):as) = faces West (x-v,y) as
faces West (x,y) ((Backward v):as) = faces West (x+v,y) as
faces West (x,y) ((TurnLeft):as) = faces South (x,y) as
faces West (x,y) ((TurnRight):as) = faces North (x,y) as