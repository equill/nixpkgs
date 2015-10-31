{ stdenv, fetchurl,
	openssl,
 } :

stdenv.mkDerivation rec {
  name = "mbuffer-20151012";

  src = fetchurl {
    url = "http://www.maier-komor.de/software/mbuffer/mbuffer-20151002.tgz";
    sha256 = "04pz70jr7fkdyax7b67g9jr0msl6ff2i8s6fl8zginqz5rrxckqk";
  };

  buildInputs = [ openssl ];

  meta = {
    homepage = http://www.maier-komor.de/mbuffer.html;
    description  = "mbuffer is a tool for buffering data streams with a large set of unique features";
    license = stdenv.lib.licenses.gpl3;
    maintainers = with stdenv.lib.maintainers; [ tokudan ];
    platforms = with stdenv.lib.platforms; all;
  };
}
