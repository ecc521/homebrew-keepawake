class Keepawake < Formula
  desc "Keep a MacBook awake with the lid closed, no external display needed"
  homepage "https://github.com/ecc521/keepawake"
  url "https://github.com/ecc521/keepawake/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "aaed702ee77a5d6b9a2b2145d2fac7964d82d5262421e7d162529d713103f2c0"
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
