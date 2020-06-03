class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]

    def index
      @items = Item.all.page(params[:page]).reverse_order
    end

    def show
      @item = Item.find(params[:id])
    end
end





























