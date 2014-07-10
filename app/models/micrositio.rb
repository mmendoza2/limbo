class Micrositio < ActiveRecord::Base

  has_and_belongs_to_many :actividad

  has_many :reverse_relationmicrositios, foreign_key: "followed_id",
           class_name:  "Relationmicrositio",
           dependent:   :destroy
  has_many :followers, through: :reverse_relationmicrositios, source: :follower




  extend FriendlyId
  friendly_id :name, use: :slugged


end
