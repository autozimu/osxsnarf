{ stdenv, lib, plan9port, darwin, which, ... }:

stdenv.mkDerivation {
  pname = "osxsnarf";
  version = "0.1.0";
  src = ./.;

  buildInputs = [ plan9port which darwin.apple_sdk.frameworks.Carbon ];

  buildPhase = ''
    9 9c osxsnarf.c
    9 9l -o osxsnarf osxsnarf.o
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp osxsnarf $out/bin/
  '';

  meta = with lib; {
    description = "A Plan 9-inspired way to share your OS X clipboard.";
    homepage = https://github.com/eraserhd/osxsnarf;
    license = licenses.publicDomain;
    platforms = platforms.darwin;
    maintainer = [ maintainers.eraserhd ];
  };
}
