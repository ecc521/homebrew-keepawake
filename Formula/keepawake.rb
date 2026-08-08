class Keepawake < Formula
  desc "Keep a MacBook awake with the lid closed, no external display needed"
  homepage "https://github.com/ecc521/keepawake"
  url "https://github.com/ecc521/keepawake/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "04378f94334b7315027c810dda049c9c125ac76b871027045abde9e203d3d442"
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
