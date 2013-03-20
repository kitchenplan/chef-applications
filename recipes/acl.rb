script "configure acl" do
    interpreter "bash"
    user "root"
    cwd "/etc"
    code <<-EOH
       cat /etc/fstab | grep -v root > /etc/fstab.tmp
       cat /etc/fstab | grep root | sed "s/remount-ro/remount-ro,acl,noatime,nodiratime/" >> /etc/fstab.tmp
       mv /etc/fstab.tmp /etc/fstab
       mount -o remount /
    EOH
    not_if "cat /etc/fstab | grep acl > /dev/null"
end

script "configure tmpfs" do
    interpreter "bash"
    user "root"
    cwd "/etc"
    code <<-EOH
       echo "tmpfs /tmp tmpfs defaults,nosuid,noatime,nodiratime 0 0" >> /etc/fstab 
       mount -a
    EOH
    not_if "cat /etc/fstab | grep tmpfs > /dev/null"
end
