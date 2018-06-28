#!/usr/bin/env ruby
#get it from https://github.com/gettalong/hexapdf/
#https://www.rubydoc.info/stdlib/fileutils
require 'hexapdf'
require 'fileutils'
current_dir=Dir.pwd # => Returns the current directory.
Dir.glob("*").select {|f| File.directory?(f) }.each do |dir|
puts dir
FileUtils.cd dir
puts FileUtils.getwd()
dirname = (File.basename(Dir.getwd))
doc = HexaPDF::Document.new
image_file = Dir.glob("*.{jpg,png,tiff}").sort.each do |pri|
puts pri
image = doc.images.add(pri)
  page = doc.pages.add
  iw = image.info.width.to_f
  ih = image.info.height.to_f                                                                                                                             
  pw = page.box(:media).width.to_f
  ph = page.box(:media).height.to_f
  rw, rh = pw / iw, ph / ih
  ratio = [rw, rh].min
  iw, ih = iw * ratio, ih * ratio
  x, y = (pw - iw) / 2, (ph - ih) / 2
  page.canvas.image(image, at: [x, y], width: iw, height: ih)
end
file=(File.basename(Dir.getwd)).to_s+".pdf"
doc.write(file)
FileUtils.mv file, current_dir
FileUtils.cd current_dir 
FileUtils.remove_dir(dir, force = false)
end