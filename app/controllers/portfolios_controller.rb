class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: "Your Portfolio item is added." }
      else
        format.html { render :new }
      end
    end
  end


  private

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body)
  end
end
