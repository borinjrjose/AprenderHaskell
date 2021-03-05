import System.Environment
import qualified Data.ByteString.Lazy as B

main = do
    (origem:destino:_) <- getArgs
    copiaByteString origem destino

copiaByteString::FilePath -> FilePath -> IO ()
copiaByteString origem destino = do
    conteudo <- B.readFile origem
    B.writeFile destino conteudo
