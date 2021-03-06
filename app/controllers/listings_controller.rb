class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: [:basics, :description, :address, :price, :photos, :calender, :bankaccount, :publish, :update]
  
  def index
  end

  def show
  end

  def new
    @listing = current_user.listings.build
  end

  def create
    #パラメーターと共に現在のユーザーのリスティングヲ作成
    @listing = current_user.listings.build(listing_params)
    
    if @listing.save
      redirect_to manage_listing_basics_path(@listing), notice: "リスティングを作成・保存しました"
    else
      redirect_to new_listing_path, notice: "リスティングを作成・保存できませんでした"
    end
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      redirect_back(fallback_location: root_path) #Rails5では元のページに戻るredirect_to :backは使えない！
      flash[:notice] = "更新できました"
    end
  end
  
  def basics
  end
  
  def description
  end
  
  def address
  end
  
  def price
  end
  
  def photos
    @photo = Photo.new
  end
  
  def calender
  end
  
  def bankaccount
  end
  
  def publish
  end
  
  private
  
  def listing_params
    params.require(:listing).permit(:home_type, :pet_type, :breeding_years, :pet_size, :price_pernight)
  end
  
  def set_listing
    @listing = Listing.find(params[:id])
  end
end
