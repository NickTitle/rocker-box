require 'sinatra'

	def init	
		set :statics_folder, 'statics'
		enable :static
	end

init()

get '/' do
	d = Dir.entries(settings.statics_folder.to_s);
	page_picker =  rand(d.count-2)
	rand_page = d[page_picker+2]
	s = 'statics/'
	s << rand_page.to_s
	send_file(s);
end

