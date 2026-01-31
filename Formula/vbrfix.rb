class vbrfix < Formula
  desc "Repair MP3 Variable Bit Rate (VBR) headers to fix seek issues"
  homepage "https://github.com/Snesnopic/vbrfix"
  url "https://github.com/Snesnopic/vbrfix/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "83223f3b281d950e2bd415b543f903b55cecb767"
  license "GPL-2.0-or-later"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/vbrfix", 255)
  end
end