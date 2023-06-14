{ buildPecl, lib, fetchFromGitHub }:

let
  version = "2.0.1";
in buildPecl {
  inherit version;

    pname = "scrypt";

    src = fetchFromGitHub {
      owner = "DomBlack";
      repo = "php-scrypt";
      rev = version;
      sha256 = "sha256-1rq9gr8r280g8qi6k71r2413w96d84dir2cms5f6n6ipiq73qh15";
    };

    doCheck = true;
    checkTarget = "test";

    zendExtension = true;

    meta = with lib; {
      changelog = "https://github.com/DomBlack/php-scrypt/releases/tag/${version}";
      description = "Provides a wrapper to Colin Percival's scrypt implementation";
    };
}
