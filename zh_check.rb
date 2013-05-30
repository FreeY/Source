require 'pathname'
def traverse(path)
	if FileTest.directory?(path)
	begin
		dir = Dir.open(path)
		while name = dir.read
			next if name == "."
			next if name == ".."
			traverse(path +"/"+name)
			
		end
	ensure
		dir.close
	end
	else
		process_file(path)
	end
end

def process_file(path)
	begin
	file = open(path)
	while text = file.gets do
		if /\p{Han}/u =~ text
			puts  '--------' +path + '-------'
			puts text
			break
		end
	end
	rescue => ex
	
	ensure
		file.close
	end	
end

#traverse("/home/yhw/Project/xxxbugarm/arm2mips-debug/optimization/arm2mips")
#traverse(Pathname.new(File.dirname(__FILE__)).realpath)
traverse(ARGV[0])

