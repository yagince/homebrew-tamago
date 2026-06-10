class Tamago < Formula
  desc "CLI terminal pet that grows with your shell activity"
  homepage "https://github.com/yagince/tamago"
  version "0.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yagince/tamago/releases/download/v#{version}/tamago-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0e0cd1a26ab5e10ff9c103537e880a8d0258f6d0bbae23e81277ffe4a0ad13d1"
    else
      url "https://github.com/yagince/tamago/releases/download/v#{version}/tamago-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "834cb3588825e082d6eb146152b8eae906200e01012a953d0af42c0b5364cc27"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yagince/tamago/releases/download/v#{version}/tamago-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0bc1a9cb66509f5f03d3059085c5de342c982f5704f04169dafd908914f7f5ec"
    else
      url "https://github.com/yagince/tamago/releases/download/v#{version}/tamago-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1566a2ed8769df2f4fb1de1d85d4fa0550ad363cf5241c8e8867b788483b1cb7"
    end
  end

  def install
    bin.install "tamago"
  end

  test do
    assert_match "tamago", shell_output("#{bin}/tamago --help")
  end
end
