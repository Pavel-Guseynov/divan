# frozen_string_literal: true

class AlbumsController < ApplicationController
  before_action :set_album, only: %i[show]

  def index
    @albums = Album.all
  end

  def show; end

  private

  def set_album
    @album = Album.find(params[:id])
  end
end
