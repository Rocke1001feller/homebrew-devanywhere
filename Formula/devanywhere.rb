class Devanywhere < Formula
  desc "一条命令把手机接入 Mac 上的 Claude Code / Codex / Cursor / opencode（WebRTC 数据面，无 VPN）"
  homepage "https://github.com/Rocke1001feller/DevAnyWhere"
  url "https://registry.npmjs.org/devanywhere/-/devanywhere-2.0.0-alpha.0.tgz"
  sha256 "cfe6681f811648be170386240e4d627882b7219defe90c448ff80367689bdf48"
  version "2.0.0-alpha.0"

  depends_on "node@22"

  def install
    # 必须从 sha256 校验过的 tarball 安装：npm 对本地目录全局安装只建软链，构建目录清理后会悬空
    system "npm", "install", "-g", "--prefix=#{libexec}", cached_download
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      开始使用：
        devanywhere login   # 邮箱+密码登录（邀请码注册的账号）
        devanywhere up      # 启动服务，手机扫终端二维码 → 登录 → 点连接
      v2 数据面为 WebRTC（无 VPN、无系统权限、无需 sudo）。
      0.9.x 老线已进入纯维护模式：brew install devanywhere@0.9.18 不可用时可用 npm i -g devanywhere@0.9.18。
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devanywhere --version")
  end
end
