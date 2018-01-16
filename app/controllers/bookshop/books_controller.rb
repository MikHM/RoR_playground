class Bookshop::BooksController < ApplicationController
  def index
    @books = Bookshop::Book.includes(:genre, :author)
  end
end
