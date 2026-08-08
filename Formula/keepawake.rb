class Keepawake < Formula
  desc "Keep a MacBook awake with the lid closed, no external display needed"
  homepage "https://github.com/ecc521/keepawake"
  url "https://github.com/ecc521/keepawake/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "e6c78479f331f96c956769efeed08387bfec15a5ad2f92a4e456fd0013cc6ba3"
  license "MIT"

  depends_on macos: :ventura

  def install
    cd "cli/keepawake" do
      system "swiftc",
             "-import-objc-header", "CGVirtualDisplayPrivate.h",
             "-framework", "Cocoa",
             "-framework", "CoreGraphics",
             "-framework", "IOKit",
             "-o", "keepawake",
             "main.swift"
      bin.install "keepawake"
    end
  end

  test do
    assert_match "Usage: keepawake", shell_output("#{bin}/keepawake --help")
  end
end
