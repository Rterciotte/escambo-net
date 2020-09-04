class AdsController < ApplicationController
    def index
      @user = current_user.id
      @ads = Ad.all
    end
    
    def show
      @user = current_user.id
      @ad = Ad.find(params[:id])
    end

    def new
      @user = current_user.id
      @ad = Ad.new
    end

    def create
      @ad.user = current_user
      @ad = Ad.new(ad_params)
      if @ad.save!
        redirect_to action: "index", alert: 'Anúncio criado com sucesso!'
      else
        render :new
      end 
    end
    
    def destroy
      @ad = Ad.find(params[:id])
      @ad.destroy
      redirect_to user_ads_path
    end

    def search
      @ads = Ad.where('name LIKE UPPER(?)', "%#{params[:q]}%")
      render :index
    end 

    private 
    
    def ad_params 
      params.require(:ad).permit(:name, :category, :description, :photo, :price, :quantity, :user_id)
    end
end