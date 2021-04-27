class Image < ApplicationRecord
  belongs_to :album

  def self.import(dir, album)
    Dir["#{dir}/*.{png,jpg,jpeg}"].each do |filename|
      image = find_or_create_by path: filename, album: album

      magick = MiniMagick::Image.new(filename)

      image.height = magick.height
      image.width = magick.width
      image.mime = magick.mime_type

      image.save!
    end
  end
end
