# frozen_string_literal: true

class Album < ApplicationRecord
  has_many :images, dependent: :destroy

  def self.import(dir)
    Dir["#{dir}/**/"].each do |filename|
      album = find_or_create_by name: File.basename(filename), path: filename

      Image.import filename, album
    end
  end
end
