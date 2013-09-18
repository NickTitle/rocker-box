require 'sinatra'

def page_pool
	d = Dir.entries(settings.statics_folder.to_s)
	d_filt = Array.new
	d.each do |i|
	
	case settings.deep_or_flat_structure
		when 'flat'
			if i.include? ".html"
				d_filt << i
			end
		when 'deep'
			if i.include? "dir_"
				d_filt << i
			end
		end
	end
	return d_filt
end

def init	
	enable :static
	set :statics_folder, 'statics'
	set :deep_or_flat_structure, 'deep'

	set :page_pool, page_pool()
end

def pick_random_page_from_pool
	page_picker =  rand(settings.page_pool.count)
	rand_page = settings.page_pool[page_picker]
	s = 'statics/'
	s << rand_page.to_s
	
	if settings.deep_or_flat_structure == 'deep'
		s << '/index.html'
	end
	
	return s
end
	
init()

get '/' do
	send_file(pick_random_page_from_pool())
end

