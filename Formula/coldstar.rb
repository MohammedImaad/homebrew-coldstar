class Coldstar < Formula
  desc "Coldstar CLI"
  homepage "https://github.com/MohammedImaad/coldstar"
  url "https://github.com/MohammedImaad/coldstar/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3014f77617417dd365c3b8d0a94930f209b2fcc2b7e5ebbf3fc5aa2701036542"
  license "MIT"

  depends_on "python@3.11"

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"main.py"
  end

  test do
    system "#{bin}/coldstar", "--help"
  end
end