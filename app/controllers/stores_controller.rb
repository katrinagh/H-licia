class StoresController < ApplicationController
  before_action :set_store, only: :show

  def index
    @stores = Store.all
    return unless params[:query].present?

    sql_subquery = <<~SQL
      stores.title ILIKE :query
      OR articles.title ILIKE :query
    SQL
    # j'aimerais avoir le résultat des pharmacies qui correspond a un article que je recherche.
    @stores = @stores.joins(:articles).where(sql_subquery, query: "%#{params[:query]}%").distinct
  end

  def show
    @articles = @store.articles
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end
end
