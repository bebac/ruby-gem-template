desc "Initialize gem"
task :geminit, :name do |t, args|
	fail "missing required name argument" unless args[:name]
	gem_name = args[:name].downcase.gsub(" ", "_")
	mod_name = args[:name].gsub(" ", "")

	File.rename "xxx.gemspec", "#{gem_name}.gemspec"

	gemspec = File.read("#{gem_name}.gemspec")
	gemspec.sub! /xxx/, "#{gem_name}"
	gemspec.sub! /Xxx/, "#{mod_name}"
	File.open("#{gem_name}.gemspec", "w+") do |file|
		file.write(gemspec)
	end

	rakefile = File.read("Rakefile")
	rakefile.sub! /xxx.gemspec/, "#{gem_name}.gemspec"
	File.open("Rakefile", "w+") do |file|
		file.write(rakefile)
	end

	version = File.read("lib/version.rb")
	version.sub! /Xxx/, mod_name
	File.open("lib/version.rb", "w+") do |file|
		file.write(version)
	end

	File.open("README.md", "w+") do |file|
		header = args[:name]
		file.puts header
		file.puts "-"*header.length
	end

	puts "gem init gem-name=#{gem_name}, module=#{mod_name}"
end