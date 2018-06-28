require 'rubygems'
require 'zip'
Zip::File.open("/home/sagnik/Desktop/todo/jsoup.zip") do |zip_file| #in the loop set the zip here 
zip_file.each do |f|
f_path = File.join("/home/sagnik/Desktop/todo/jsp", f.name) #set the zip.basename here
FileUtils.mkdir_p(File.dirname(f_path))
f.extract(f_path) 
end
end
