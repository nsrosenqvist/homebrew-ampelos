class Keel < Formula
  desc "Dev-loop wrapper that adapts to your project"
  homepage "https://github.com/nsrosenqvist/keel"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.0.0" # updated automatically by CI

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/keel/releases/download/v#{version}/keel-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER" # updated automatically by CI
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/keel/releases/download/v#{version}/keel-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/keel/releases/download/v#{version}/keel-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER"
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/keel/releases/download/v#{version}/keel-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "keel"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/keel --version")
  end
end
