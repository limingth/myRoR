class Category < ActiveRecord::Base
belongs_to :user
has_many :article_categories
has_many :articles, through: :article_categories
validates :name, presence: true
end
