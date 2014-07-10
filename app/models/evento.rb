class Evento < ActiveRecord::Base
  belongs_to :user



  extend FriendlyId
  friendly_id :nombre, use: :slugged

end
