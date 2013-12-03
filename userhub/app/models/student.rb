class Student < ActiveRecord::Base
belongs_to :user
validates :name, presence: true
validates :email, presence: true
validates :major, presence: true
end
