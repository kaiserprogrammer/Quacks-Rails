class UsersController < ApplicationController
  def show
    user_id = params[:id].to_i
    @view = UserView.new
    presenter = UserPresenter.new(user_id, @view, DB.new)
    presenter.update_view
  end

  def index
    @view = UsersView.new
    presenter = UsersPresenter.new(@view, DB.new)
    presenter.update_view
  end

  def update
    type = params[:commit]
    quote_id = params[:quote_id].to_i
    if user_id and quote_id
      if type == "like"
        t = UserLikesQuote.new(user_id, quote_id, DB.new)
      elsif type == "dislike"
        t = UserDislikesQuote.new(user_id, quote_id, DB.new)
      end
    end
    t.execute
    redirect_to user_path(user_id)
  end
end
