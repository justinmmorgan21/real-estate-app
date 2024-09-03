class HomesController < ApplicationController

  def index
    @homes = Home.all
    render :index
  end

  def create
    @home = Home.create(
      description: params[:description],
      year_built: params[:year_built],
      square_feet: params[:square_feet],
      bedrooms: params[:bedrooms],
      bathrooms: params[:bathrooms],
      floors: params[:floors],
      availability: params[:availability],
      address: params[:address],
      price: params[:price]
    )
    render :show
  end

  def show
    @home = Home.find_by(id: params[:id])
    render :show
  end

  def update
    @home = Home.find_by(id: params[:id])
    @home.update(
      description: params[:description] || @home.description,
      year_built: params[:year_built] || @home.year_built,
      square_feet: params[:square_feet] || @home.square_feet,
      bedrooms: params[:bedrooms] || @home.bedrooms,
      bathrooms: params[:bathrooms] || @home.bathrooms,
      floors: params[:floors] || @home.floors,
      availability: params[:availability] || @home.availability,
      address: params[:address] || @home.address,
      price: params[:price] || @home.price
    )
    render :show
  end

  def delete
    @home = Home.find_by(id: params[:id])
    @home.destroy
    render json: {result: "Home at #{@home.address} deleted successfully."}
  end
end
