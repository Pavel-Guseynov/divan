# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :album

  def self.import(dir, album)
    Dir.chdir dir
    Dir['*.{png,jpg,jpeg}'].each do |filename|
      image = find_or_initialize_by path: "#{dir}#{filename}", album: album

      next if image.persisted?

      magick = MiniMagick::Image.new(filename)

      image.height = magick.height
      image.width = magick.width
      image.mime = magick.mime_type

      image.save!
    end
  end
end
