class Coldstar < Formula
  include Language::Python::Virtualenv

  desc "Coldstar CLI"
  homepage "https://github.com/MohammedImaad/coldstar"
  url "https://github.com/MohammedImaad/coldstar/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "b81bfd327a9b0355347d0926a42f667857a1bc92d85ba93435154fdd66b84c16"
  license "MIT"

  depends_on "python@3.11"

  def install
    venv = virtualenv_create(libexec, "python3.11")

    # Manually bootstrap pip
    system libexec/"bin/python", "-m", "ensurepip"

    # Upgrade pip inside venv
    system libexec/"bin/pip", "install", "--upgrade", "pip"

    # Install dependencies manually
    system libexec/"bin/pip", "install", "-r", "local_requirements.txt"

    # Install your package
    system libexec/"bin/pip", "install", "."

    # Create executable
    bin.install_symlink libexec/"bin/coldstar"
  end

  test do
    system "#{bin}/coldstar", "--help"
  end
end