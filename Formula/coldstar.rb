class Coldstar < Formula
  desc "Coldstar CLI"
  homepage "https://github.com/MohammedImaad/coldstar"
  url "https://github.com/MohammedImaad/coldstar/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "b81bfd327a9b0355347d0926a42f667857a1bc92d85ba93435154fdd66b84c16"
  license "MIT"

  depends_on "python@3.11"

  def install
    libexec.install Dir["*"]

    # Install dependencies globally into Homebrew python
    system "python3.11", "-m", "pip", "install", "-r", "local_requirements.txt"

    (bin/"coldstar").write <<~EOS
      #!/bin/bash
      exec python3.11 #{libexec}/main.py "$@"
    EOS
  end

  test do
    system "#{bin}/coldstar", "--help"
  end
end