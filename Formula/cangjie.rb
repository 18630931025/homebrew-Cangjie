class Cangjie < Formula
  desc "仓颉输入法引擎"
  homepage "https://github.com/18630931025/cangjie-0.53.18"
  url "https://github.com/18630931025/cangjie-0.53.18/releases/download/v0.53.18/Cangjie-0.53.18-darwin_aarch64.tar.gz"
  sha256 "0044b6810ef78b19ec451ef0514a8d4de1634ae36e4680746e89b329b381991e" # 替换为实际的SHA256值
  license "MIT"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "glib"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "#{bin}/cangjie", "--version"
  end
end
