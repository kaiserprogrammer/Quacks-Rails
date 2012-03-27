
class AuthorsController < ApplicationController
  # GET /authors
  # GET /authors.json
  def index
    @view = AuthorsView.new
    presenter = AuthorsPresenter.new(@view, DB.new)
    presenter.update_view
  end

  # GET /authors/1
  # GET /authors/1.json
  def show
    author_id = params[:id].to_i
    @view = AuthorView.new
    presenter = AuthorPresenter.new(author_id, @view, DB.new)
    presenter.update_view
  end

  def new
  end

  # POST /authors
  # POST /authors.json
  def create
    name = params[:name]
    t = AddAuthor.new(params[:name], DB.new) if not name.blank?
    t.execute

    redirect_to author_path(t.author_id)
  end

  # PUT /authors/1
  # PUT /authors/1.json
  def update
    author_id = params[:id].to_i
    quote = params[:quote]
    if user_id and not quote.blank?
      t = AddQuote.new(user_id, author_id, quote, DB.new)
      t.execute
    end
    redirect_to author_path(author_id)
  end
end
