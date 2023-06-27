{ buildPecl, lib, fetchFromGitHub, libmcrypt, pkg-config }:

let
  version = "1.0.6";
  revision =  "afb7052e1fa604c383c57a4354443167522f3953";
in buildPecl {
  inherit version;

    pname = "mcrypt";

    src = fetchFromGitHub {
      owner = "php";
      repo = "pecl-encryption-mcrypt";
      rev = revision;
      sha256 = "sha256-PRaBRnPWZ/1pwWtZxez7Vk47CQ59hF6TKLlqTY/jelA=";
    };

    nativeBuildInputs = [ pkg-config ];
    buildInputs = [ libmcrypt ];

    configureFlags = [ "--with-mcrypt=${libmcrypt.outPath}" ];

    doCheck = true;
    checkTarget = "test";

    zendExtension = false;

    meta = with lib; {
      changelog = "https://github.com/php/pecl-encryption-mcrypt/releases/tag/${version}";
      description = "Provides a wrapper to Colin Percival's scrypt implementation";
    };
}
