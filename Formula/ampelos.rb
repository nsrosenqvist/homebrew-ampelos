class Ampelos < Formula
  desc "Dev-loop wrapper that adapts to your project"
  homepage "https://github.com/nsrosenqvist/ampelos"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.1.0" # updated automatically by CI

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/ampelos/releases/download/v#{version}/ampelos-aarch64-apple-darwin.tar.gz"
      sha256 "d173aa2e560119a511279b1236dc6a9f014766b5f613101dacb56abe9ba46bd4" # updated automatically by CI
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/ampelos/releases/download/v#{version}/ampelos-x86_64-apple-darwin.tar.gz"
      sha256 "6a37dd6135512223a005759232685fcf631a0185674fb4d54858b034c6a29cd9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/ampelos/releases/download/v#{version}/ampelos-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8a85cbab16331185fbbcee487c56c597d0d1fbee74d8e2bbf6433e7a70b1636e"
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/ampelos/releases/download/v#{version}/ampelos-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8b1053b12ea87e7ec9d09982f16ad9aa425b256d6eb4afb67d62f7612d50d6f9"
    end
  end

  def install
    bin.install "ampelos"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ampelos --version")
  end
end
