class Reserervation < ActiveRecord::Base
  belongs_to :user
  belongs_to :micrositio
end
