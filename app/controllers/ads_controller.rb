class AdsController < ApplicationController
  def index
    @ads = Ad.all
  end
    
  def show
    @ad = Ad.find(params[:id])
  end

  def new
    
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(ad_params)
    if @ad.save
      redirect_to @ad, alert: 'Anúncio criado com sucesso!'
    else
      render :new
    end 
  end
    
  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy
    redirect_to ads_path
  end

  def search
    @ads = Ad.where('name LIKE UPPER(?)', "%#{params[:q]}%")
    render :index
  end 

  private 
    
  def ad_params 
    params.require(:ad).permit(:name, :category, :description, :photo, :price, :quantity)
  end
end