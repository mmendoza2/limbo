class Micrositio < ActiveRecord::Base
  belongs_to :user
  belongs_to :estado
  has_and_belongs_to_many :actividad

  has_many :reverse_relationmicrositios, foreign_key: "followed_id",
           class_name:  "Relationmicrositio",
           dependent:   :destroy
  has_many :followers, through: :reverse_relationmicrositios, source: :follower

  validates :reference, presence: true



  extend FriendlyId
  friendly_id :name, use: :slugged


end
