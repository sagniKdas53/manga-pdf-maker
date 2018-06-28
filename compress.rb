require 'rubygems'
require 'zip'

folder = "/home/sagnik/Desktop/todo"
#input_filenames = ['*.jpg', '.txt', 'stats.csv']

zipfile_name = "/home/sagnik/Desktop/todo/todo.zip"

Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
  image_file = Dir.glob("*.{rb,sh,txt}").sort.each do |filename|
    # Two arguments:
    # - The name of the file as it will appear in the archive
    # - The original file, including the path to find it
    zipfile.add(filename, folder + '/' + filename)
  end
  zipfile.get_output_stream("myFile") { |os| os.write "myFile contains just this" }
end
