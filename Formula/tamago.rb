class Tamago < Formula
  desc "CLI terminal pet that grows with your shell activity"
  homepage "https://github.com/yagince/tamago"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yagince/tamago/releases/download/v#{version}/tamago-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "d1ff55d5bfa4cfe17ee91f75710ae2cc983c42b8a6f6f91de8c971fefcc4ec85"
    else
      url "https://github.com/yagince/tamago/releases/download/v#{version}/tamago-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "45ade1f7b46e5d13f56e7260cf6716a1dec86df292b609ed23261bc2d86cb952"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yagince/tamago/releases/download/v#{version}/tamago-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5e09376992b6ee44be2499858c85f563ecdf0231396c9581013da13b85d717bf"
    else
      url "https://github.com/yagince/tamago/releases/download/v#{version}/tamago-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3728fe97c3a26a781dbb5ec3852b4ae86a38b076fcabd0f70069f976ceddbe82"
    end
  end

  def install
    bin.install "tamago"
  end

  test do
    assert_match "tamago", shell_output("#{bin}/tamago --help")
  end
end
