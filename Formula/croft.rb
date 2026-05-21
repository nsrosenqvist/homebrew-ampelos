class Croft < Formula
  desc "Per-project dev-loop tool that adapts to your project"
  homepage "https://github.com/nsrosenqvist/croft"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.1.1" # updated automatically by CI

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/croft/releases/download/v#{version}/croft-aarch64-apple-darwin.tar.gz"
      sha256 "6b7e41499e9eea2cb379a25a90d0ec65d3d1102f8ef44088b922a11e4fa7ab6c" # updated automatically by CI
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/croft/releases/download/v#{version}/croft-x86_64-apple-darwin.tar.gz"
      sha256 "17df3239c00d115053163b5e750b30d164be0db967459b5f1b0cbfa983b1b41f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/croft/releases/download/v#{version}/croft-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fea4cad24f9c5b2b808d8ce9e4483532ad82af9d6d59f8e158d4a0c05980fe26"
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/croft/releases/download/v#{version}/croft-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fcb20888ae46292e8bd3b71ab549271402cad2ff073ae6081777775f4d8b114c"
    end
  end

  def install
    bin.install "croft"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/croft --version")
  end
end
