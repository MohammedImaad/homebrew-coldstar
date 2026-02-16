class Coldstar < Formula
  desc "Coldstar CLI"
  homepage "https://github.com/devsyrem/coldstar"
  url "https://github.com/devsyrem/homebrew-coldstar/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "4738fcade68f2158a8bb541eb1a27598d0f764a0d3a8a2400916ca5ce9dfd9b7"
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