package "build-essential" do
    action [:install, :upgrade]
end
#You can't place linux-headers-`uname -r` in a list, if you do it throws an error
package "linux-headers-`uname -r`" do
    action [:install, :upgrade]
end
