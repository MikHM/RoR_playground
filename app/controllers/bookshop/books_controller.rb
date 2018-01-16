class Bookshop::BooksController < ApplicationController
  def index
    @books = Bookshop::Book.all
  end
end
