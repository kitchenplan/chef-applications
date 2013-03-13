if platform?("ubuntu")
    node["ubuntu"]["desktop"]["packages"].each do |pkg|
        package pkg do
            action [:install, :upgrade]
        end
    end
end
