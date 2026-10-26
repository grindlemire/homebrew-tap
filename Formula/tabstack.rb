# Written by cmd/tabstack/release.sh in github.com/grindlemire/tabstack.
class Tabstack < Formula
  desc "Command-line tool and cross-profile helper for the tabstack browser extension"
  homepage "https://tabstack.alethi.dev"
  # brew would read 64 from the arm64 in its URL
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/grindlemire/homebrew-tap/releases/download/tabstack-v1.1.0/tabstack-1.1.0-darwin-arm64.tar.gz"
      sha256 "d55d58187dad60fc5f6489f0c290078d5a9247b284754635f65e02f60e6ee980"
    end
    on_intel do
      url "https://github.com/grindlemire/homebrew-tap/releases/download/tabstack-v1.1.0/tabstack-1.1.0-darwin-amd64.tar.gz"
      sha256 "a9791c80e6d1378eacb4b166e38a76d9b9c7891ccc0385f53b9378f8afbfb18f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/grindlemire/homebrew-tap/releases/download/tabstack-v1.1.0/tabstack-1.1.0-linux-amd64.tar.gz"
      sha256 "161d6d93c8af3743d15132a46b90c87d474c2a4ffc681067410146716438e0ae"
    end
    on_arm do
      url "https://github.com/grindlemire/homebrew-tap/releases/download/tabstack-v1.1.0/tabstack-1.1.0-linux-arm64.tar.gz"
      sha256 "74f6dfd71a39ca95e67b413e94f7c557ca0b3a71cf11076f4ff47b8edfa46060"
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
