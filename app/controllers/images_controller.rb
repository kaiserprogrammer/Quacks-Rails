class ImagesController < ApplicationController
  def edit
    @author_id = params[:id].to_i
  end

  def update
    author_id = params[:id].to_i
    url = params[:url]
    t = AddImage.new(author_id, url, DB.new)
    t.execute
    redirect_to author_path(author_id)
  end
end
