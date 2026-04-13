class Tamago < Formula
  desc "CLI terminal pet that grows with your shell activity"
  homepage "https://github.com/yagince/tamago"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yagince/tamago/releases/download/v#{version}/tamago-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "a30b5e39096d5bf300fce1ba26aa840444a13ee589b20674e2a164ddb759f1fb"
    else
      url "https://github.com/yagince/tamago/releases/download/v#{version}/tamago-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "0f93ce2404298b3b78469b769f5a792c2e2408df7ff7549dfabc41700a0e3759"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yagince/tamago/releases/download/v#{version}/tamago-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "311aec17a59030300eb6de67c3959390ec2d41b1872b2b165dd0d631a1c412f4"
    else
      url "https://github.com/yagince/tamago/releases/download/v#{version}/tamago-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "53872795e9fa735cabe705e5a80a730d2e3cf4e7309292b5d6b84a3d20a4b59a"
    end
  end

  def install
    bin.install "tamago"
  end

  test do
    assert_match "tamago", shell_output("#{bin}/tamago --help")
  end
end
