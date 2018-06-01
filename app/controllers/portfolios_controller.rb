class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  layout "portfolio"
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]}, admin: :all


  def index
    # TODO: clean this, JS implementation for switching btw projects type
    @portfolios = Portfolio.by_position
    #@portfolios = Portfolio.react
    #@portfolios = Portfolio.ruby_on_rails_portfolio_items
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    render nothing: true
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

  def edit 
    # TODO: Add JS implementation to avoid the repetition after the ones that are already set.
    3.times { @portfolio_item.technologies.build }    
  end

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
