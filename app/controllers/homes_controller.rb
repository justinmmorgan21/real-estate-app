class HomesController < ApplicationController

  def index
    @homes = Home.all
    render :index
  end
end
