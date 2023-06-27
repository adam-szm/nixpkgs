{ buildPecl, lib, fetchFromGitHub }:

let
  version = "v2.0.1";
  revision =  "845b889bdbe817afe1633237f8fc68667c7a700b";
in buildPecl {
  inherit version;

    pname = "scrypt";

    src = fetchFromGitHub {
      owner = "DomBlack";
      repo = "php-scrypt";
      rev = revision;
      sha256 = "sha256-JUA8Do43Gmtc0ZWJHBtBzSQ+AhE5nGkiRg8gkVF+Cec=";
    };

    doCheck = true;
    checkTarget = "test";

    zendExtension = true;

    meta = with lib; {
      changelog = "https://github.com/DomBlack/php-scrypt/releases/tag/${version}";
      description = "Provides a wrapper to Colin Percival's scrypt implementation";
    };
}
