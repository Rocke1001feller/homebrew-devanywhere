class Devanywhere < Formula
  desc "一条命令把手机接入 Mac 上的 Claude Code（EasyTier 组网 + CloudCLI Web UI）"
  homepage "https://github.com/Rocke1001feller/devanywhere-cli"
  url "https://registry.npmjs.org/devanywhere/-/devanywhere-0.9.17.tgz"
  sha256 "1921a56f651b7ebd496ab8de3aec3f9d35a8aaa2f5acc01ce4c94d68117e5d1d"

  depends_on "node"

  def install
    # 必须从 sha256 校验过的 tarball 安装：npm 对本地目录全局安装只建软链，构建目录清理后会悬空
    system "npm", "install", "-g", "--prefix=#{libexec}", cached_download
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
