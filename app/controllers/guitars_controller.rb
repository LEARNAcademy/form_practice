class GuitarsController < ApplicationController
  def index
    guitars = Guitar.all
    render json: guitars
  end

  def create
    guitar = Guitar.new(guitar_params)
    if guitar.save
      render json: guitar, status: 201
    else
      render json: guitar.errors, status: 422
    end
  end

  private
  def guitar_params
    params.require(:guitar).permit(:model, :year)
  end
end
