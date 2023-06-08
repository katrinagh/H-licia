class StoresController < ApplicationController
  before_action :set_store, only: :show

  def index
    @stores = Store.all
  end

  def show
    @articles = @store.articles
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end
end
