require "formula"

class Mackup < Formula
  homepage "https://github.com/danielmahon/mackup"
  url "https://github.com/danielmahon/mackup.git", :using => :git
  head "https://github.com/danielmahon/mackup.git"

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    system "python", *Language::Python.setup_install_args(libexec)
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    system "#{bin}/mackup", "--help"
  end
end
