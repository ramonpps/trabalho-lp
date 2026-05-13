import System.Environment (getArgs)
import Data.List (sortBy)
import qualified Data.Map as M

replaceChar :: String -> Char -> Char
replaceChar sep c = if c `elem` sep then ' ' else c

replaceSeparators :: String -> String -> String
replaceSeparators sep text = map (replaceChar sep) text

toWeight :: [String] -> String -> (String, Int)
toWeight res w = (w, if w `elem` res then 2 else 1)

getFrequencies :: [String] -> String -> String -> M.Map String Int
getFrequencies res sep text =
    let cleanText = replaceSeparators sep text
        tokens = words cleanText -- 'arroz com feijao' -> ['arroz', 'com', feijao']
        weights = map (toWeight res) tokens
    in M.fromListWith (+) weights

compareEntries :: (String, Int) -> (String, Int) -> Ordering
compareEntries (w1, f1) (w2, f2) = compare f2 f1 <> compare w1 w2

printEntry :: (String, Int) -> IO ()
printEntry (w, f) = putStrLn $ w ++ ": " ++ show f

main :: IO ()
main = do
    args <- getArgs
    if length args /= 4
        then putStrLn "Uso: ./bow <res.txt> <sep.txt> <c1.txt> <c2.txt>"
        else do
            let [fRes, fSep, fC1, fC2] = args
            resContent <- readFile fRes
            sepContent <- readFile fSep
            c1Content  <- readFile fC1
            c2Content  <- readFile fC2

            let res      = words resContent
            let sepChars = filter (`notElem` "\n\r") sepContent

            let freq1 = getFrequencies res sepChars c1Content
                freq2 = getFrequencies res sepChars c2Content

            let sortedF1 = sortBy compareEntries (M.toList freq1)

            let isSimilar f1 f2 = 10 * abs (f1 - f2) <= max f1 f2
                m = sum [ f1 | (w, f1) <- M.toList freq1
                             , let f2 = M.findWithDefault 0 w freq2
                             , isSimilar f1 f2 ]

                somaF1      = sum (M.elems freq1)
                similaridade = if somaF1 == 0 then 0.0 else fromIntegral m / fromIntegral somaF1

            putStrLn "Relatório de Frequências(C1)"
            mapM_ printEntry sortedF1

            putStrLn "\n=== MÉTRICAS DE SIMILARIDADE ==="
            putStrLn $ "Valor de m    : " ++ show m
            putStrLn $ "Soma(f1)      : " ++ show somaF1
            putStrLn $ "Índice final  : " ++ show similaridade