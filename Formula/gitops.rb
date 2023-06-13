class Gitops < Formula
  desc "CLI tool for performing gitops tasks"
  homepage "https://github.com/mxcd/gitops-cli"
  url "https://github.com/mxcd/gitops-cli/archive/2.1.1.tar.gz"
  sha256 "bd59776bc82ac4a734d0893f4ade869a0ec7b58cb98433b5a6108a20de29141b"
  license "MIT"
  depends_on "go" => :build

  def install
    # ENV["GOPATH"] = buildpath
    path = buildpath/"cmd/gitops"
    cd path do
      system "go", "build", "-o", "#{bin}/gitops"
    end
  end

  test do
    shell_output("#{bin}/gitops", "-h")
  end
end