#python-setuptools is needed for easy_install
#python-dev is needed for the header files of python
packages = %w[ build-essential python-setuptools python-dev]

packages.each do |pkg|
    package pkg do
        action [:install, :upgrade]
    end
end
#You can't place linux-headers-`uname -r` in the list, if you do it throws an error
package "linux-headers-`uname -r`" do
    action [:install, :upgrade]
end
