class Admin::ItemsController < ApplicationController
	# before_action :admin_user

	def new
		@item = Item.new
	end

  def index
    @items = Item.all.page(params[:page]).reverse_order
  end

  def show
    @item = Item.find(params[:id])
  end

	def edit
      @item = Item.find(params[:id])
    end

    def create
    	@item = Item.new(itam_params)
    	if @item.save
         flash[:notice] = "商品を追加しました"
    	   redirect_to admin_items_path
      else
        render action: :new
      end
    end

    def update
      @item = Item.find(params[:id])
      if @item.update(itam_params)
         flash[:notice] = "商品内容を編集しました"
         redirect_to admin_item_path(@item)
      else
        render action: :edit
      end
    end


    def destroy
      @item = Item.find(params[:id])
      @item.destroy
      redirect_to admin_items_path
    end

  private

    def itam_params
    	params.require(:item).permit(:product, :explanation, :price ,:item_image)
    end

end
