module Placeholder
  extend ActiveSupport::Concern

  def self.image_generator(height:, width:)
    "https://placeholdit.imgix.net/~text?txtsize=33&txt=350%C3%97200&#{width}&#{height}"
  end
end