class Gitops < Formula
  desc "CLI tool for performing gitops tasks"
  homepage "https://github.com/mxcd/gitops-cli"
  url "https://github.com/mxcd/gitops-cli/archive/2.1.3.tar.gz"
  sha256 "d752d38a4b5ec8d59abec5ae8538963c21a14084e2633d7ab0c09b891170f483"
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