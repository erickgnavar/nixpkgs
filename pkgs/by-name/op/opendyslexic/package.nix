{ lib, stdenvNoCC, fetchTarball }:

stdenvNoCC.mkDerivation rec {
  pname = "opendyslexic";
  version = "20160623-Stable";

  src = fetchTarball {
    url = "https://github.com/antijingoist/open-dyslexic/archive/refs/tags/${version}.tar.gz"
    sha256 = "a44fde7d5fcf1e3825d00de20f7d71fb7b339a7e71067cd9566e8ab16692802a";
  };

  dontPatch = true;
  dontConfigure = true;
  dontBuild = true;
  doCheck = false;
  dontFixup = true;

  installPhase = ''
    runHook preInstall
    install -Dm644 -t $out/share/fonts/otf/ otf/*.ttf
    runHook postInstall
  '';

  meta = with lib; {
    description = "OpenDyslexic is a typeface designed against some common symptoms of dyslexia. If you like the way you are able to read this page, and others, then this typeface is for you!";
    homepage = "https://opendyslexic.org/";
    license = licenses.ofl ;
    maintainers = with maintainers; [ vinnymeller ];
    platforms = platforms.all;
  };
}
