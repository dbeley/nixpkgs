{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "llmfit";
  version = "0.9.5";

  src = fetchFromGitHub {
    owner = "AlexsJones";
    repo = "llmfit";
    tag = "v${finalAttrs.version}";
    hash = "sha256-L962y6gKrsVvR1urD/bcgsln54X+sn2KKnYcHUp7tcQ=";
  };

  cargoHash = "sha256-rPgavxXfMGAz2BhodnpReBn2aJ6B2i3nPq5Lf3CRpLA=";

  meta = {
    description = "Find what runs on your hardware";
    homepage = "https://github.com/AlexsJones/llmfit";
    changelog = "https://github.com/AlexsJones/llmfit/releases/tag/v${finalAttrs.src.rev}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [
      matthiasbeyer
    ];
    mainProgram = "llmfit";
  };
})
