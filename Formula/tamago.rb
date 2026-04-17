class Tamago < Formula
  desc "CLI terminal pet that grows with your shell activity"
  homepage "https://github.com/yagince/tamago"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yagince/tamago/releases/download/v#{version}/tamago-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "4b0e44244f1ff7feb25a8c914a51ad8184d5f7e2d60a9788f25b8624c4dbedeb"
    else
      url "https://github.com/yagince/tamago/releases/download/v#{version}/tamago-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "39ffac4cd140383a796fd048f5d85deccc0091e889ebc47426c5a246ba3ac6b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yagince/tamago/releases/download/v#{version}/tamago-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "42c68fabd301ef9bc11a2158c48fa63fee97968f2db6abd8fd917fdfcf6c5525"
    else
      url "https://github.com/yagince/tamago/releases/download/v#{version}/tamago-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "61fbb59fd764e21f9486b916d59486c173d2b74ba58225d2d6f54ce302636eb4"
    end
  end

  def install
    bin.install "tamago"
  end

  test do
    assert_match "tamago", shell_output("#{bin}/tamago --help")
  end
end
