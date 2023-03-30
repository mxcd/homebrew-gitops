class Gitops < Formula
  desc "CLI tool for performing gitops tasks"
  homepage "https://github.com/mxcd/gitops-cli"
  url "https://github.com/mxcd/gitops-cli/archive/2.0.0-beta-2.tar.gz"
  sha256 "a99bfc6769eb6e94ed9fb1fe4223f4567e896f85c836c34ce37d5b9eb49704ca"
  license "MIT"
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    path = buildpath/"cmd/gitops"
    cd path do
      system "go", "build", "-o", "#{bin}/gitops"
    end
  end

  test do
    shell_output("#{bin}/gitops", "-h")
  end
end
