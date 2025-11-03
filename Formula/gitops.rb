class Gitops < Formula
  desc "CLI tool for performing gitops tasks"
  homepage "https://github.com/mxcd/gitops-cli"
  url "https://github.com/mxcd/gitops-cli/archive/2.3.1.tar.gz"
  sha256 "72d02c600aef383f958e0be9252064039d166da7f1ba6fcd1044822c1790beac"
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