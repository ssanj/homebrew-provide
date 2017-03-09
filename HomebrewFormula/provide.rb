class Provide < Formula
  desc "Serve http content quickly"
  homepage "https://github.com/ssanj/provide"
  version "0.0.1"
  url "https://github.com/ssanj/provide/releases/download/v#{version}/provide", :using => :nounzip
  sha256 "570521dd168a52582a6f2da80fe923cf5032f05d8a4af69692a5bad2b67b7e88"
  head "https://github.com/ssanj/provide.git"

  if build.head?
    depends_on :java => "1.8+"
    depends_on "sbt" => :build
  end

  def install
    if build.head?
      # ENV.java_cache
      system "sbt", "assembly"
      bin.install "target/scala-2.12/provide" => "provide"
    else
      bin.install "provide" => "provide"
    end
  end

  test do
    expected_output = "Provide version:"
    assert_includes shell_output("#{bin}/provide -version"), expected_output
  end
end