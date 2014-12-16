File::open("./cookbooks/mimic_opsworks/attributes/default.rb") do |f|
  f.each do |line|
    match = line.scan(/default\[:(.*)\] = "(.*)"/)
    ENV[match[0][0]] = match[0][1] if match[0] && !match[0][0].include?('][')
  end
end
