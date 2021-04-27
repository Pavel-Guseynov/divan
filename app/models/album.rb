class Album < ApplicationRecord
  ROOT_IMAGES_DIR = '/Users/pavelguseynov/Downloads/vr_images'

  has_many :images

  def self.import
    Dir["#{ROOT_IMAGES_DIR}/**/"].each do |filename|
      album = find_or_create_by name: File.basename(filename), path: filename

      Image.import filename, album
    end
  end
end
