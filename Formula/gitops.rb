class Gitops < Formula
  desc "CLI tool for performing gitops tasks"
  homepage "https://github.com/mxcd/gitops-cli"
  url "https://github.com/mxcd/gitops-cli/archive/2.0.0-rc1.tar.gz"
  sha256 "f1201b343bc7011afb5c4dc2b8aef8ef3be0722af949cc73822d509533836149"
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