class HomesController < ApplicationController
  def index
    @homes = Home.all
    # render :index

    hash = {}
    @homes.each { |home|
      puts home.description
      puts home.latitude
      puts home.longitude
      tempF = HTTP.get("https://api.openweathermap.org/data/2.5/weather?lat=#{home.latitude}&lon=#{home.longitude}&appid=256718d62b79103d0ec53ccaa3da3317&units=imperial").parse["main"]["temp"]
      tempC = HTTP.get("https://api.openweathermap.org/data/2.5/weather?lat=#{home.latitude}&lon=#{home.longitude}&appid=256718d62b79103d0ec53ccaa3da3317&units=metric").parse["main"]["temp"]
      tempK = HTTP.get("https://api.openweathermap.org/data/2.5/weather?lat=#{home.latitude}&lon=#{home.longitude}&appid=256718d62b79103d0ec53ccaa3da3317&units=standard").parse["main"]["temp"]
      hash["#{home.id}"] = {description: "#{home.description}", tempF: tempF, tempC: tempC, tempK: tempK}

    }
    render json: hash
  end

  def create
    address = params[:address]
    coordinates = Geocoder.coordinates(address)
    @home = Home.create(
      description: params[:description],
      year_built: params[:year_built],
      square_feet: params[:square_feet],
      bedrooms: params[:bedrooms],
      bathrooms: params[:bathrooms],
      availability: params[:availability],
      address: params[:address],
      price: params[:price],
      latitude: coordinates[0],
      longitude: coordinates[1]
    )
    render :show
  end

  def show
    @home = Home.find_by(id: params[:id])
    render :show
  end

  def update
    @home = Home.find_by(id: params[:id])
    address = params[:address] || @home.address
    coordinates = Geocoder.coordinates(address)
    @home.update(
      description: params[:description] || @home.description,
      year_built: params[:year_built] || @home.year_built,
      square_feet: params[:square_feet] || @home.square_feet,
      bedrooms: params[:bedrooms] || @home.bedrooms,
      bathrooms: params[:bathrooms] || @home.bathrooms,
      availability: params[:availability] || @home.availability,
      address: params[:address] || @home.address,
      price: params[:price] || @home.price,
      latitude: coordinates[0],
      longitude: coordinates[1]
    )
    render :show
  end

  def delete
    @home = Home.find_by(id: params[:id])
    @home.destroy
    render json: {result: "Home at #{@home.address} deleted successfully."}
  end
end
