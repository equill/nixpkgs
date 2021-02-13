{ stdenv, fetchFromGitHub, pkg-config, alsaLib, gtk3-x11, pango, lib }:

stdenv.mkDerivation rec {
  name = "bbfpromix";
  version = "2020.06.24";

  src = fetchFromGitHub {
    owner = "MrBollie";
    repo = "bbfpromix";
    rev = "b371896d9a66bbb45f88b2b67bd7b46b39c9be03";
    sha256 = "sha256:1508h9rzxyci687wxrlvz2r87wdxrzmb7rc3dxpkvppk4b8ra1rb";
  };

  nativeBuildInputs = [
    pkg-config
    alsaLib
    gtk3-x11
    pango
  ];

  installFlags = [
    "DESTDIR=$(out)"
    "PREFIX=''"
  ];

  meta = with lib; {
    description = "Mixer for the RME Babyface Pro FS audio interface";

    longDescription = ''
      The Babyface Pro FS mixer (bbfpromix) provides a graphical user
      interface for the features available in CC (Class-Compliant) mode.
      It provides access to the mixing matrix, and flags such as the
      clock and optical modes.
      It's also known to work for the previous, non-FS version of this
      interface.
    '';

    homepage = "https://github.com/MrBollie/bbfpromix";

    downloadPage = "https://github.com/MrBollie/bbfpromix";

    # License is not currently stated in the repo.
    license = lib.licenses.unfree;

    maintainers = with maintainers; [ equill ];

    platforms = platforms.linux;
  };
}
