class FavouritesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @favourites = current_user.favourites.all
  end
  def create
    favourite = current_user.favourites.create(posting_page_id: params[:posting_page_id])
    redirect_to posting_pages_url, notice: "#{favourite.posting_page.user.name}さんの投稿をお気に入り登録しました"
  end
  def destroy
    favourite = current_user.favourites.find_by(id: params[:id]).destroy
    redirect_to posting_pages_url, notice: "#{favourite.posting_page.user.name}さんの投稿をお気に入り解除しました"
  end
end
