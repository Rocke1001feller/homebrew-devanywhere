class Devanywhere < Formula
  desc "一条命令把手机接入 Mac 上的 Claude Code（EasyTier 组网 + CloudCLI Web UI）"
  homepage "https://github.com/Rocke1001feller/devanywhere-cli"
  url "https://registry.npmjs.org/devanywhere/-/devanywhere-0.1.0.tgz"
  sha256 "72d8d61ebe7bfebae2b3354dc9d8f50eb5427aaf698738e9cf595e942670609b"

  depends_on "node"

  def install
    system "npm", "install", "-g", "--prefix=#{libexec}", "."
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      开始使用：devanywhere up（首次会索取 sudo 密码创建虚拟网卡）
      本软件源码可见、保留所有权利，非开源许可。
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devanywhere --version")
  end
end
