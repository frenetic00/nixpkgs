{
  lib,
  buildPackages,
  fetchurl,
  stdenv,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "mawk";
  version = "1.3.4-20240622";

  src = fetchurl {
    urls = [
      "https://invisible-mirror.net/archives/mawk/mawk-${finalAttrs.version}.tgz"
      "ftp://ftp.invisible-island.net/mawk/mawk-${finalAttrs.version}.tgz"
    ];
    hash = "sha256-TpF+h6ep+692mVeEpLC13A3ZVLl30JgwMPePagexp2U=";
  };

  depsBuildBuild = [ buildPackages.stdenv.cc ];

  meta = {
    homepage = "https://invisible-island.net/mawk/mawk.html";
    changelog = "https://invisible-island.net/mawk/CHANGES";
    description = "Interpreter for the AWK Programming Language";
    license = lib.licenses.gpl2Only;
    mainProgram = "mawk";
    maintainers = with lib.maintainers; [ ehmry ];
    platforms = lib.platforms.unix;
  };
})
