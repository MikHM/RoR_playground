class Portfolio < ApplicationRecord
  include Placeholder
  validates_presence_of :title, :subtitle, :body, :main_image, :thumb_image

  has_many :technologies
  accepts_nested_attributes_for :technologies, reject_if: lambda { |attrs| attrs['name'].blank? }


  ## scopes
  def self.react
    where(subtitle: "React")
  end

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby On Rails")}

  # initializing
  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '150')
  end

end