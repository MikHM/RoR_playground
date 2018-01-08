class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:edit, :show, :update]

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

  def edit; end

  def show; end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: "You Portfolio Item has been updated."}
      else
        format.html { render :edit }
      end
    end
  end


  private

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body)
  end

  def set_portfolio
    @portfolio_item = Portfolio.find(params[:id])
  end
end
