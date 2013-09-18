require 'sinatra'

# set the path of your static assets folder, and whether you want a flat or deep pool structure
# flat structure will pool all html files directly inside the static folder
# deep structure will serve index.html files inside of folders within the static folder

def init	
	enable :static
	set :statics_folder, 'statics'
	set :deep_or_flat_structure, 'flat'

	set :public_folder, settings.statics_folder

	set :page_pool, page_pool()
end

#page pool checks your pool location and returns either files or folders, depending on whether you are deep or flat
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

#this method chooses a random page from the pool which you defined earlier
#if the app is using deep structure, it chooses a folder, and then serves the enclosed index.html file
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
	#a random page is served from your pool on each hit to the root url
	send_file(pick_random_page_from_pool())
end

