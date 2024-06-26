{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "catppuccin-yazi";
  version = "unstable-2024-06-17";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "yazi";
    rev = "9bfdccc2b78d7493fa5c5983bc176a0bc5fef164";
    hash = lib.fakeHash;
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out
    cp -r themes/* $out
    runHook postInstall
  '';

  meta = with lib; {
    description = "Soothing pastel theme for yazi";
    homepage = "https://github.com/catppuccin/yazi";
    license = licenses.mit;
    maintainers = with maintainers; [];
    mainProgram = "yazi";
    platforms = platforms.all;
  };
}

