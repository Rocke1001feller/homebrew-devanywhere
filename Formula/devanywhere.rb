class Devanywhere < Formula
  desc "一条命令把手机接入 Mac 上的 Claude Code / Codex / Cursor / opencode（WebRTC 数据面，无 VPN）"
  homepage "https://github.com/Rocke1001feller/DevAnyWhere"
  url "https://registry.npmjs.org/@devanywhere/cli/-/cli-2.0.0-alpha.3.tgz"
  sha256 "b39d16b71e35db1001b2bcf454e9d8cefca596d0d37696a2d60bd9e27a6b6f11"
  version "2.0.0-alpha.3"

  depends_on "node@22"

  def install
    # 必须从 sha256 校验过的 tarball 安装：npm 对本地目录全局安装只建软链，构建目录清理后会悬空
    system "npm", "install", "-g", "--prefix=#{libexec}", cached_download
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      v2 线发布于 @devanywhere/cli（本 formula）；unscoped devanywhere 包为 0.9.x 老线专用通道。
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
