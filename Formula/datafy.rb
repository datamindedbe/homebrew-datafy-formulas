class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.34.0/datafy_darwin_amd64.tar.gz"
  version "0.34.0"
  sha256 "c5ce589306d0b569cfd06e9289823fc58d43646777a004c9385d59d012ce9692"

  def install
    bin.install "darwin/amd64/datafy" => "datafy"

    # Install bash completion
    output = Utils.safe_popen_read("#{bin}/datafy", "completion", "bash", { :err => :out })
    (bash_completion/"datafy").write output

    # Install zsh completion
    output = Utils.safe_popen_read("#{bin}/datafy", "completion", "zsh", { :err => :out })
    (zsh_completion/"_datafy").write output
  end
end
