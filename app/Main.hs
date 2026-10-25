module Main where
import System.Environment (getArgs)
import Data.Char (toUpper)
import Data.List

main :: IO ()
main = do
    args <- getArgs
    let mode = head args
        script = args !! 2
    if length args < 2 || not (".gana" `isSuffixOf` script) || notElem "mode" modes
        then do
            putStrLn "Compile: hira build <file.gana> --　こんぱいる: ひら　びるど <ふぁいる.がな>"
            putStrLn "Run: hira run <file.gana> --　すくりぷと: ひら　すくりぷと <ふぁいる.がな>"
        else do
            src <- readFile (head args)
            let lns = lines src
            mapM_ (putStrLn . parse) lns

modes :: [String]
modes = ["build","run"]

parse :: String -> String
parse ('￥':'￥':c:cs) = '￥' : parseChar c : parse cs
parse ('￥':c:cs) = toUpper (parseChar c) : parse cs
parse (c:cs) = parseChar c : parse cs
parse [] = []

parseChar :: Char -> Char
parseChar 'あ' = 'a'
parseChar 'え' = 'e'
parseChar 'い' = 'i'
parseChar 'お' = 'o'
parseChar 'う' = 'u'
parseChar 'は' = 'h'
parseChar 'か' = 'k'
parseChar 'ま' = 'm'
parseChar 'な' = 'n'
parseChar 'ぱ' = 'p'
parseChar 'ら' = 'r'
parseChar 'さ' = 's'
parseChar 'た' = 't'
parseChar 'わ' = 'w'
parseChar 'や' = 'y'
parseChar 'ば' = 'b'
parseChar 'だ' = 'd'
parseChar 'が' = 'g'
parseChar 'じ' = 'j'
parseChar 'ざ' = 'z'
parseChar 'し' = 'c'
parseChar 'ふ' = 'f'
parseChar 'り' = 'l'
parseChar 'く' = 'q'
parseChar 'ゔ' = 'v'
parseChar 'す' = 'x'
parseChar '　' = ' '
parseChar '。' = '.'
parseChar '（' = '('
parseChar '）' = ')'
parseChar '：' = ':'
parseChar '＝' = '='
parseChar '”' = '"'
parseChar '、' = ','
parseChar '！' = '!'
parseChar x = x
