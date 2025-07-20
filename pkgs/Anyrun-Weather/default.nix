{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  openssl,
  stdenv,
  darwin,
}:

rustPlatform.buildRustPackage rec {
  pname = "anyrun-weather";
  version = "0.1.2";

  src = fetchFromGitHub {
    owner = "zjm54321";
    repo = "Anyrun-Weather";
    rev = "v0.1.2";
    hash = "sha256-+t9hsgJAs9LvYg4Ts0JyXwyvigpiXF2/B0H0SgzmNMs=";
  };

  cargoHash = "sha256-IikP2NpEfRmbFUL7hVsEZ/0Ge9QVM8W2f8tqM5vdyPI=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    openssl
  ];

  doCheck = true;

  # 确保正确的库类型
  buildType = "release";

  # 构建 cdylib 类型的库
  cargoBuildFlags = [ "--lib" ];

  meta = with lib; {
    description = "OpenWeatherApi plugin for Anyrun launcher";
    homepage = "https://github.com/Matipolit/Anyrun-Weather";
    maintainers = with maintainers; [ "zjm54321" ];
    platforms = platforms.linux;
  };
}
