class Gitops < Formula
  desc "CLI tool for performing gitops tasks"
  homepage "https://github.com/mxcd/gitops-cli"
  url "https://github.com/mxcd/gitops-cli/archive/2.0.0-beta-6.tar.gz"
  sha256 "9369701a21d6596fe36658906630f376c4d2b5fc83759cad7b12caff6c0a1fb6"
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