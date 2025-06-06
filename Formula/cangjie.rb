class Cangjie < Formula
  desc "Cangjie input method engine"
  homepage "https://github.com/18630931025/cangjie-0.53.18"
  version "0.53.18"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "file:///Users/pllab/Documents/Cangjie-0.53.18-darwin_aarch64.tar.gz" 
      sha256 "0044b6810ef78b19ec451ef0514a8d4de1634ae36e4680746e89b329b381991e"
    else
      url "https://github.com/18630931025/cangjie-0.53.18/releases/download/v0.53.18/Cangjie-0.53.18-darwin_x64.tar.gz"
      sha256 "2ce777c02c5c0c264ce6a2a1bbaf46ed981698c43cd967b096d2ecc116c29801"
    end
  end
  
  def install
    # 创建必要的目录结构
    libexec.mkpath
    
    # 安装所有内容到 libexec
    %w[bin lib modules runtime third_party tools].each do |dir|
      libexec.install dir if File.directory?(dir)
    end
    
    # 安装其他文件
    libexec.install "envsetup.sh"
    
    # 创建符号链接到公共区域
    bin.install_symlink libexec/"bin/cangjie"
    
    # 处理库文件
    lib.install_symlink Dir[libexec/"lib/*.dylib"] if File.directory?(libexec/"lib")
    
    # 确保环境设置脚本可用
    (share/"cangjie").install_symlink libexec/"envsetup.sh"
  end
  
  def caveats
    <<~EOS
      安装完成！请运行以下命令设置环境：
        source #{opt_share}/cangjie/envsetup.sh
        
      或添加到您的 shell 配置文件（如 ~/.zshrc）：
        [[ -f "#{opt_share}/cangjie/envsetup.sh" ]] && source "#{opt_share}/cangjie/envsetup.sh"
    EOS
  end
  
  test do
    # 设置测试环境
    ENV["CANGJIE_HOME"] = opt_libexec
    
    # 测试版本命令
    system bin/"cangjie", "--version"
  end
end