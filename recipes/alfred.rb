applications_package "Alfred" do
    source "http://cachefly.alfredapp.com/Alfred_2.0.2_178.zip"
    not_if File.exists?("/Applications/Alfred 2.app")
end
