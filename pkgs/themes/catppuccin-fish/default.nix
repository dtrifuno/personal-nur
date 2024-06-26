{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "catppuccin-fish";
  version = "unstable-2024-05-14";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "fish";
    rev = "a3b9eb5eaf2171ba1359fe98f20d226c016568cf";
    hash = "sha256-a2X9WToZmctD1HZVqN9A512iPd+3dtjRloBEifgteF4=";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out
    cp -r themes/* $out
    runHook postInstall
  '';

  meta = with lib; {
    description = "Soothing pastel theme for fish";
    homepage = "https://github.com/catppuccin/fish";
    license = licenses.mit;
    maintainers = with maintainers; [];
    #mainProgram = "fish";
    platforms = platforms.all;
  };
}

