{ mkDerivation, aeson, base, bytestring, hpack, servant
, servant-server, stdenv, text
}:
mkDerivation {
  pname = "find-your-tribe";
  version = "0.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  libraryToolDepends = [ hpack ];
  executableHaskellDepends = [
    aeson base bytestring servant servant-server text
  ];
  preConfigure = "hpack";
  description = "SincHack .17% project";
  license = stdenv.lib.licenses.mit;
}
