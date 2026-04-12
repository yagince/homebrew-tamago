class Tamago < Formula
  desc "CLI terminal pet that grows with your shell activity"
  homepage "https://github.com/yagince/tamago"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yagince/tamago/releases/download/v#{version}/tamago-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c317f78a6e581cd2301f16ded0ef5c3dd128f1ab58489ccbe0e85bee3eb980ba"
    else
      url "https://github.com/yagince/tamago/releases/download/v#{version}/tamago-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "3f22cbfcc2d6056384524446a0c1130ae929a4437cec3927b042f430734702d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yagince/tamago/releases/download/v#{version}/tamago-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7e245e7b2217e7f87228207f4b80e41bf407bd6e4a9a8891a0dee0fcf4018274"
    else
      url "https://github.com/yagince/tamago/releases/download/v#{version}/tamago-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a8f0c8d2165bf910da3c3b97edefd9af0f45a9722bc954945243cc595757ac9f"
    end
  end

  def install
    bin.install "tamago"
  end

  test do
    assert_match "tamago", shell_output("#{bin}/tamago --help")
  end
end
