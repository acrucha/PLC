-- ! Prova 1 - 2019.1
-- 1) ( 2.5) Escreva uma função que funcione como uma função "meio" ou "mid" do Excel: ela recebe 3 parâmetros, uma String e 
-- dois números ( digamos x e y), e retorna a substring que começa no primeiro índice ( o primeiro número, x )e contém y caracteres.
-- A primeira posição na lista tem índice 1 ( um). Casos inválidos retornam a lista vazia (por exemplo, números negativos ou inicio 
-- fora do tamanho da lista). Se a lista contiver menos caracteres que o solicitado deve ser retornado o que for possível.
-- Exemplos: meio "ver isso" 5 4 --------------> "isso"
--           meio "ver isso tambem" 1 3 -------> "ver"
--           meio "ver isso tambem" 13 10 -----> "bem"
--           meio "ver isso tambem" 130 ( -4 )-> ""
-- meio :: String -> Int -> Int -> String

meio :: String -> Int -> Int -> String
meio "" cur n  = ""
meio str cur n = take n (drop (cur-1) str)

-- 2) (2.5) Escreva uma função localizar, que indica a posição de início de uma String dentro de outra. Caso não seja encontrada ou a 
-- String de busca seja vazia, deve ser retornado o valor 0 (zero). A contagem das posições começa no valor 1 para o primeiro caracter. 
-- Deve ser retornada a posicao da primeira ocorrencia, se houver mais de uma.
-- Exemplos: localizar "abc" "xyz12abrt" ----> 0
--           localizar "abc" "aaabrsabcfr" --> 7
--           localizar "aab" "aacrabceaabc" -> 9
--           localizar "" "aacrabceaabc" ----> 0
-- localizar :: String -> String -> Int

contem :: String -> String -> Bool
contem str1 str2 | str1 == (take (length str1) str2) = True
                 | otherwise                         = False

checagem :: String -> String -> Int -> Int
checagem str "" cur = 0
checagem str (b:bs) cur | length (b:bs) < length str = 0
                        | contem str (b:bs)          = cur
                        | otherwise                  = checagem str bs (cur+1)

localizar :: String -> String -> Int
localizar "" str = 0
localizar str "" = 0
localizar str1 str2 = checagem str1 str2 1

-- 3) Uma fita infinita de papel pode ser representada por uma lista de caracteres. Esta fita possui uma cabeça de leitura/escrita que le ou escreve na posição atual da fita. Esta fita pode ser lida ou escrita (alterada) pelos seguintes comandos:
-- ParaFrente -- Que recebe um inteiro N como parâmetro e move a posição de leitura N posições para frente;
-- ParaTras -- que recebe um inteiro N como parâmetro e move a posição de leitura N posições para tras;
-- Escreva -- que recebe um caracter como parametro e escreve o caracter naquela posicao da fita, substituindo o caracter que estiver naquela posicao;
-- A fita comeca na posicao de numero 1.
-- Nao é preciso tratar o caso da fita se mover para uma posicao invalida (menor que 1).

-- data Comando = ParaFrente Int
--              | ParaTras Int
--              | Escreva Char
--              deriving (Show, Eq)


-- 3.1) (2.0) Esreva uma funcao que diga a posicao final da fita, apos receber uma lista de comandos.
-- Exemplos:
-- posicaofinal "abcdefghijklmno" [ParaFrente 5, Escreva 'x', ParaFrente 1, Escreva 'y', ParaTras 1] ---> 6
-- posicaofinal "abcdefghijklmno" [ParaFrente 5, Escreva 'x', ParaFrente 1, Escreva 'y']  --------------> 7
-- posicaofinal "abcdefghijklmno" [ParaFrente 5, Escreva 'x', ParaFrente 1]  ---------------------------> 7
-- posicaofinal "abcdefghijklmno" [] -------------------------------------------------------------------> 1
-- posicaofinal :: String -> [Comando] -> Int 

data Cmd = ParaFrente Int
         | ParaTras Int
         | Escreva Char
         deriving (Show, Eq)

add :: Char -> Int -> String -> (Int, String)
add c cur str = (cur, take (cur-1) str ++ [c] ++ drop cur str)

runCommand :: (Int, [Cmd]) -> String -> (Int, [Cmd], String)
runCommand (cur, []) str = (cur, [], str)

runCommand (cur, (ParaFrente n:as)) str | str == ""          = runCommand (cur, as) str
                                        | cur+n > length str = runCommand (length str, as) str
                                        | otherwise          = runCommand (cur+n, as) str

runCommand (cur, (ParaTras n:as)) str | str == ""  = runCommand (cur, as) str 
                                      | cur-n >= 1 = runCommand (cur-n, as) str
                                      | otherwise  = runCommand (1, as) str

runCommand (cur, (Escreva c:as)) str = runCommand (fst addChar, as) (snd addChar)
       where addChar = add c cur str


posicaofinal :: String -> [Cmd] -> Int 
posicaofinal str []   = 1
posicaofinal str cmds = cursor
       where (cursor, commands, result) = runCommand (1, cmds) str

-- 3.2) (2.0) Escreva uma funcao que, dada uma lista de comandos, retorne o caracter da posicao final da cabeca de leitura, apos comandos.
-- Exemplos:
-- interprete "abcdefghijklmno" [ParaFrente 5, Escreva 'x', ParaFrente 1, Escreva 'y', ParaTras 1] ---> 'x'
-- interprete "abcdefghijklmno" [ParaFrente 5, Escreva 'x', ParaFrente 1, Escreva 'y']  --------------> 'y'
-- interprete "abcdefghijklmno" [ParaFrente 5, Escreva 'x', ParaFrente 1]  ---------------------------> 'g'
-- interprete "abcdefghijklmno" [] -------------------------------------------------------------------> 'a'
-- interprete :: String -> [Comando] -> Char

interprete :: String -> [Cmd] -> Char 
interprete (a:as) [] = a
interprete str cmds  = a
       where 
           (cursor, commands, result) = runCommand (1, cmds) str
           (a:as) = drop (cursor-1) result

-- 3.3) (1.0) Escreva a mesma funcao anterior, mas que mostre toda a String apos a interpretacao
-- estadofinal "abcdefghijklmno" [] -------------------------------------------------------------------> "abcdefghijklmno"
-- estadofinal "abcdefghijklmno" [ParaFrente 5, Escreva 'x', ParaFrente 1]  ---------------------------> "abcdexghijklmno"
-- estadofinal :: String -> [Comando] -> String

estadofinal :: String -> [Cmd] -> String
estadofinal str []   = str
estadofinal str cmds = result
       where (cursor, commands, result) = runCommand (1, cmds) str