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
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Matipolit";
    repo = "Anyrun-Weather";
    rev = "main"; # 使用最新的 main 分支，因为没有版本标签
    hash = "sha256-nVD4C/mVjtDn9zLHv8GpbJ2No+/ISqczE6/l15hQ9cs=";
  };

  cargoHash = "sha256-/V+h3yjkvYCJevZUWsN8MhAtf1GV/GkvD+3/vFeLfiE=";

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
    maintainers = [ maintainers.zjm54321 ];
    platforms = platforms.linux;
  };
}
