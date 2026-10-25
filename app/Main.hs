module Main where
import System.Environment (getArgs)
import Data.Char
import Data.List

main :: IO ()
main = do
    args <- getArgs
    let mode = head args
        script = args !! 1
    if length args < 2 || not (".gana" `isSuffixOf` script) || notElem mode modes
        then do
            putStrLn "Compile: hira build <file.gana> --　こんぱいる: ひら　びるど <ふぁいる.がな>"
            putStrLn "Run: hira run <file.gana> --　すくりぷと: ひら　すくりぷと <ふぁいる.がな>"
        else do
            case mode of
                "build" -> do
                    src <- readFile script
                    let lns = lines src
                    mapM_ (putStrLn . parse) lns
                "run" -> error "not implemented yet"
                _ -> error "unknown mode"

modes :: [String]
modes = let ms = ["build","run"]
        in ms ++ map parse' ms

-- EN -> JP
parse' :: String -> String
parse' (c:cs) | isUpper c = '￥' : parseChar' c : parse' cs
              | otherwise = parseChar' c : parse' cs
parse' [] = []

-- JP -> EN
parse :: String -> String
parse ('￥':c:cs) = toUpper (parseChar c) : parse cs
parse (c:cs) = parseChar c : parse cs
parse [] = []

-- EN -> JP
parseChar' :: Char -> Char
parseChar' 'a' = 'あ'
parseChar' 'e' = 'え'
parseChar' 'i' = 'い'
parseChar' 'o' = 'お'
parseChar' 'u' = 'う'
parseChar' 'h' = 'は'
parseChar' 'k' = 'か'
parseChar' 'm' = 'ま'
parseChar' 'n' = 'な'
parseChar' 'p' = 'ぱ'
parseChar' 'r' = 'ら'
parseChar' 's' = 'さ'
parseChar' 't' = 'た'
parseChar' 'w' = 'わ'
parseChar' 'y' = 'や'
parseChar' 'b' = 'ば'
parseChar' 'd' = 'だ'
parseChar' 'g' = 'が'
parseChar' 'j' = 'じ'
parseChar' 'z' = 'ざ'
parseChar' 'c' = 'し'
parseChar' 'f' = 'ふ'
parseChar' 'l' = 'り'
parseChar' 'q' = 'く'
parseChar' 'v' = 'ゔ'
parseChar' 'x' = 'す'
parseChar' ' ' = '　'
parseChar' '.' = '。'
parseChar' '(' = '（'
parseChar' ')' = '）'
parseChar' ':' = '：'
parseChar' '=' = '＝'
parseChar' '"' = '”'
parseChar' ',' = '、'
parseChar' '!' = '！'
parseChar' x = x

-- JP -> EN
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
