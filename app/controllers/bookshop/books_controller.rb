class Bookshop::BooksController < ApplicationController
  layout "bookshop"
  
  def index
    @books = Bookshop::Book.includes(:genre, :author)
  end
end
