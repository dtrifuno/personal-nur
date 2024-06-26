{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "catppuccin-bat";
  version = "unstable-2024-04-25";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "bat";
    rev = "d714cc1d358ea51bfc02550dabab693f70cccea0";
    hash = lib.fakeHash;
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out
    cp -r themes/* $out
    runHook postInstall
  '';

  meta = with lib; {
    description = "Soothing pastel theme for bat";
    homepage = "https://github.com/catppuccin/bat";
    license = licenses.mit;
    maintainers = with maintainers; [];
    #mainProgram = "yazi";
    platforms = platforms.all;
  };
}

