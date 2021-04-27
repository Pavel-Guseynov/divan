# frozen_string_literal: true

class ImagesController < ApplicationController
  before_action :set_image, except: :index

  def index
    @images = Image.all
  end

  def show; end

  def file
    send_file @image.path
  end

  private

  def set_image
    @image = Image.find params[:id]
  end
end
