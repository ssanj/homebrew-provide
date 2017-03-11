class Provide < Formula
  desc "Serve http content quickly"
  homepage "https://github.com/ssanj/provide"
  version "0.0.1"
  url "https://github.com/ssanj/provide/releases/download/v#{version}/provide", :using => :nounzip
  sha256 "570521dd168a52582a6f2da80fe923cf5032f05d8a4af69692a5bad2b67b7e88"
  head "https://github.com/ssanj/provide.git"

  def install
      bin.install "provide" => "provide"
  end

  test do
    expected_output = "Provide version: #{version}"
    assert_includes shell_output("#{bin}/provide -version"), expected_output
  end
end