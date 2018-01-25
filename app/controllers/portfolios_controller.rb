class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  layout "portfolio"

  def index
    # TODO: clean this
    @portfolios = Portfolio.all
    #@portfolios = Portfolio.react
    #@portfolios = Portfolio.ruby_on_rails_portfolio_items
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your Portfolio item is added.' }
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

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'The Portfolio Item has been deleted!' }
    end
  end


  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle, 
                                      :body, 
                                      :main_image, 
                                      :thumb_image, 
                                      technologies_attributes:[:name])
  end

  def set_portfolio
    @portfolio_item = Portfolio.find(params[:id])
  end
end
