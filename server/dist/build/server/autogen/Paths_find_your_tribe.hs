{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_find_your_tribe (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/bikeboi/.cabal/bin"
libdir     = "/home/bikeboi/.cabal/lib/x86_64-linux-ghc-8.2.2/find-your-tribe-0.0.0-JGeHZergeQe7T4IUHkMNsS-server"
dynlibdir  = "/home/bikeboi/.cabal/lib/x86_64-linux-ghc-8.2.2"
datadir    = "/home/bikeboi/.cabal/share/x86_64-linux-ghc-8.2.2/find-your-tribe-0.0.0"
libexecdir = "/home/bikeboi/.cabal/libexec/x86_64-linux-ghc-8.2.2/find-your-tribe-0.0.0"
sysconfdir = "/home/bikeboi/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "find_your_tribe_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "find_your_tribe_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "find_your_tribe_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "find_your_tribe_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "find_your_tribe_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "find_your_tribe_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
