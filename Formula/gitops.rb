class Gitops < Formula
  desc "CLI tool for performing gitops tasks"
  homepage "https://github.com/mxcd/gitops-cli"
  url "https://github.com/mxcd/gitops-cli/archive/2.2.4.tar.gz"
  sha256 "b3ef864230cfedfddf9dd62ad32dfa550eff770b98a74a1b263e77a3f1aacf7b"
  license "MIT"
  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    cd "cmd/gitops" do
      system "go", "build", *std_go_args(ldflags: ldflags)
    end
  end

  test do
    shell_output("#{bin}/gitops", "--version")
  end
end