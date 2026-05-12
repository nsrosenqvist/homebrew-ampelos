class Ampelos < Formula
  desc "Dev-loop wrapper that adapts to your project"
  homepage "https://github.com/nsrosenqvist/ampelos"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.0.1" # updated automatically by CI

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/ampelos/releases/download/v#{version}/ampelos-aarch64-apple-darwin.tar.gz"
      sha256 "718e4f1efcaed1d81c43dc0ac9344076494cb6fd1c87d5b091b15093d47b7eec" # updated automatically by CI
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/ampelos/releases/download/v#{version}/ampelos-x86_64-apple-darwin.tar.gz"
      sha256 "08cd7a9cbe111b4e58b48f827d2eb5f5f1efaeb345119e08b637841d6f362094"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/ampelos/releases/download/v#{version}/ampelos-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "653578cf36c9ffb024bad34f4dd6d16c66e2f2faadfe96e56f4a3c9234c3f2d0"
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/ampelos/releases/download/v#{version}/ampelos-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "19059b8da59f581deb1377cdf17b57301f7cef94ca1037c7facbd389330b3d78"
    end
  end

  def install
    bin.install "ampelos"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ampelos --version")
  end
end
