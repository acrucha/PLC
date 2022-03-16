main = do
    a <- getLine
    let result = executa (read a)
    print result

type Comando = String
type Valor = Int

executa :: [(Comando, Valor)] -> Int
executa list = executa1 0 list

executa1 :: Valor -> [(Comando, Valor)] -> Int
executa1 v [] = v
executa1 v1 (("Multiplica", v2):as) = executa1 (v1*v2) as
executa1 v1 (("Soma", v2):as) = executa1 (v1+v2) as
executa1 v1 (("Subtrai", v2):as) = executa1 (v1-v2) as
executa1 v1 (("Divide", 0):as) = executa1 (-666) as
executa1 v1 (("Divide", v2):as) = executa1 (v1 `div` v2) as