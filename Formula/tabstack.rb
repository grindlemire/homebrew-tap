# Written by cmd/tabstack/release.sh in github.com/grindlemire/tabstack.
class Tabstack < Formula
  desc "Command-line tool and cross-profile helper for the tabstack browser extension"
  homepage "https://tabstack.alethi.dev"
  # brew would read 64 from the arm64 in its URL
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/grindlemire/homebrew-tap/releases/download/tabstack-v1.2.0/tabstack-1.2.0-darwin-arm64.tar.gz"
      sha256 "bca08cb97efd827b685767d8170277822672f2e3877c9e1f20cc3ee32c9ae768"
    end
    on_intel do
      url "https://github.com/grindlemire/homebrew-tap/releases/download/tabstack-v1.2.0/tabstack-1.2.0-darwin-amd64.tar.gz"
      sha256 "50a5697ce4341255da577e8c0d09bc5840ebf5ba004ceea5b5e2a1c05915c264"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/grindlemire/homebrew-tap/releases/download/tabstack-v1.2.0/tabstack-1.2.0-linux-amd64.tar.gz"
      sha256 "12da1669b0015baf86ac88f619e9cc85150936a61cfd69281ca7cf4aaef80b3d"
    end
    on_arm do
      url "https://github.com/grindlemire/homebrew-tap/releases/download/tabstack-v1.2.0/tabstack-1.2.0-linux-arm64.tar.gz"
      sha256 "b90b83c70fff735249702297786bc2eb43dc19b285bc9b4a45658b1bf7eff79d"
    end
  end

  def install
    bin.install "tabstack"
    generate_completions_from_executable(bin/"tabstack", "completion")
  end

  def caveats
    <<~EOS
      To connect tabstack in each of your browser profiles, run:
        tabstack install
      Before uninstalling, run tabstack uninstall to disconnect them.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tabstack version")
  end
end
