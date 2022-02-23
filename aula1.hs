-- * ANOTAÇÕES AULA 1 - PLC
-- ! todas as declarações de variável não são mutáveis
-- ! os tipos de variável começam com letra maiúscula
-- as variáveis devem começar com letras minúsculas mas não quer dizer que não possam ter letras maiúsculas
-- comando :t diz o tipo
-- pode utilizar ; pra serparar declarações na mesma linha: x = 10; y = 9

imc :: Double -> Double -> Double 
imc x y = x / (y * y) 
-- ! o operador "/" faz a divisão completa de ponto flutuante e a função "div" faz a divisão inteira (só aceita Int)
imc2 :: Int -> Int -> Int 
imc2 x y = x `div` (y * y) 

-- o que vem depois da última seta é o tipo do resultado, nas de antes são os parâmetros
-- ou seja, essa função tem 2 parâmetros (inputs) Double e gera um resultado (output) também Double

mini :: Int -> Int -> Int -> Bool -- ? haskell já tem uma função min/max na biblioteca padrão, por isso adicionamos o "i" no final
mini a b c = (a < b) && (b < c)
{- descrevendo:
    a função mini quando recebe 3 parâmetros quaisquer (a, b e c) do tipo Int retorna o resultado da expressão
    (a < b) && (b < c) em Bool -} 

-- ? a linguagem haskell infere (deduz) o tipo de funções e variáveis de acordo com o valor
    -- por exemplo:
yes :: Bool
yes = True

no = False -- haskell vai inferir o tipo da variável "no" a partir do valor False -> indicará Bool

square x = x * x -- haskell dirá que o tipo é Num

-- haskell é estaticamente tipificada (como C e java)

maxi :: Int -> Int -> Int 
maxi n m | n >= m    = n -- se for verdade, retorna n (tipo if)
         | otherwise = m -- caso contrário, retorna m (tipo else)
-- | são cáusulas de guarda (tipo o comando if e else) 

-- haskell também tem if mas não são comandos (veremos mais pra frente)

{- 
! as funções em haskell tem maior prioridade na hora da execução, então caso eu mande executar: square 10 + 2
! ele executará primeiro a função square com parâmetro 10 e somaria 2 ao resultado.
ou seja, 
    *input: square 10 + 2 
    *output: 102 
caso eu coloque:
    *input: square (10 + 2)
    *output: 144 
-}

{-
*Exemplo:
Em um sistema de controle de vendas:
• suponha vendas semanais dadas pela função
    * vendas :: Int -> Int
• total de vendas da semana 0 à semana n?
vendas 0 + vendas 1 + ... + vendas (n-1) + vendas n
* usamos uma função recursiva ao invés de um laço pois laços não fazem sentido em haskell
* ou seja, sempre que precisamos de repetição -> utilizamos recursão
-}

vendas :: Int -> Int
vendas n = mod n 17 -- mod é uma função de haskell

totalVendas :: Int -> Int
totalVendas n   | n == 0    = vendas 0
                | n > 0     = totalVendas (n-1) + vendas n
                | otherwise = 0
