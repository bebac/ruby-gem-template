require 'fileutils'

def file_gsub!(filename, *subs)
	s = File.read(filename)
	subs.each do |sub|
		s.gsub! sub[0], sub[1]		
	end
	File.open(filename, "w+") do |file|
		file.write(s)
	end
end

desc "Initialize gem"
task :geminit, :name do |t, args|	
	fail "missing required name argument" unless args[:name]

	gem_name = args[:name].downcase.gsub(" ", "_")
	mod_name = args[:name].gsub(" ", "")

	File.rename "xxx.gemspec", "#{gem_name}.gemspec"
	File.rename "lib/xxx", "lib/#{gem_name}"

	file_gsub! "#{gem_name}.gemspec", [/xxx/, "#{gem_name}"], [/Xxx/, "#{mod_name}"]
	file_gsub! "Rakefile", [/xxx.gemspec/, "#{gem_name}.gemspec"]
	file_gsub! "lib/#{gem_name}/version.rb", [/Xxx/, mod_name]

	File.open("README.md", "w+") do |file|
		header = args[:name]
		file.puts header
		file.puts "-"*header.length
	end

	# The geminit task is useless after this i guess.
	File.unlink "rakelib/geminit.rake"

	# We want to start on a fresh repository.
	FileUtils.remove_entry_secure ".git"
end