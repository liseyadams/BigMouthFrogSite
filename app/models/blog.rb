class Blog < ApplicationRecord
  enum status: { Draft: 0, Published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
  title_changed?
  end

  validates_presence_of :title, :body, :topic_id

  belongs_to :topic

  has_many :comments, dependent: :destroy

  def self.special_blogs
    all
  end

  def self.featured_blogs
    limit(2)
  end

  def self.recent
    order("created_at DESC")
  end
end
