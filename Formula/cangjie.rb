class Cangjie < Formula
  desc "Cangjie input method engine"
  homepage "https://github.com/18630931025/cangjie-0.53.18"
  version "0.53.18"
  license "MIT" # 替换为实际许可证
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/18630931025/cangjie-0.53.18/releases/download/v0.53.18/Cangjie-0.53.18-darwin_aarch64.tar.gz"
      sha256 "0044b6810ef78b19ec451ef0514a8d4de1634ae36e4680746e89b329b381991e" # 替换为实际值
    else
      url "https://github.com/18630931025/cangjie-0.53.18/releases/download/v0.53.18/Cangjie-0.53.18-darwin_x64.tar.gz"
      sha256 "2ce777c02c5c0c264ce6a2a1bbaf46ed981698c43cd967b096d2ecc116c29801" # 替换为实际值
    end
  end
  
  def install
    # 安装可执行文件
    bin.install "bin/cangjie"
    
    # 安装库文件
    lib.install Dir["lib/*"]
    
    # 安装资源文件（如果有）
    # share.install "share/cangjie"
  end
  
  test do
    # 测试命令是否正常工作
    system "#{bin}/cangjie", "--version"
  end
end