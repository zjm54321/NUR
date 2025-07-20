{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  openssl,
}:

rustPlatform.buildRustPackage {
  pname = "anyrun-weather";
  version = "0.1.2";

  src = fetchFromGitHub {
    owner = "zjm54321";
    repo = "Anyrun-Weather";
    rev = "v0.1.2";
    hash = "sha256-i8+J0185A4v7kuYCyID0Y0psqZMwsz7ZLl1TS4Xwl+s=";
  };

  cargoHash = "sha256-IikP2NpEfRmbFUL7hVsEZ/0Ge9QVM8W2f8tqM5vdyPI=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    openssl
  ];

  doCheck = false;

  # 确保正确的库类型
  buildType = "release";

  # 构建 cdylib 类型的库
  cargoBuildFlags = [ "--lib" ];

  meta = with lib; {
    description = "OpenWeatherApi plugin for Anyrun launcher";
    homepage = "https://github.com/Matipolit/Anyrun-Weather";
    maintainers = [ "zjm54321" ];
    platforms = platforms.linux;
  };
}
