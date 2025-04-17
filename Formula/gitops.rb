class Gitops < Formula
  desc "CLI tool for performing gitops tasks"
  homepage "https://github.com/mxcd/gitops-cli"
  url "https://github.com/mxcd/gitops-cli/archive/2.2.3.tar.gz"
  sha256 "e65b70a5184fe1d77c12ebacd8b24445caba566deae9f15d7749eb7a98592d20"
  license "MIT"
  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    cd "cmd/gitops" do
      system "go", "build", *std_go_args(ldflags: ldflags)
    end
  end

  test do
    shell_output("#{bin}/gitops", "-h")
  end
end